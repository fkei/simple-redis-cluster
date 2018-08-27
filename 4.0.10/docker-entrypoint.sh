#!/bin/bash

home_dir=/docker
rm -rf ${home_dir}/*

__conf_dir=${home_dir}/conf
__data_dir=${home_dir}/data
__log_dir=${home_dir}/log
__lock_dir=${home_dir}/lock
__tmp_dir=${hoge_dir}/tmp

#mkdir -p ${home_dir}
mkdir -p ${__conf_dir}
mkdir -p ${__log_dir}
mkdir -p ${__lock_dir}
mkdir -p ${__tmp_dir}

__lock_file=${__lock_dir}/redis.lock
__listen_file=${__tmp_dir}/redis-cluster.listen

IPADDR=`ip --oneline --family inet address show dev eth0 | cut -d' ' -f7 | cut -d'/' -f1`

# Initialize configs
for p in 7000 7001 7002 7003 7004 7005
do
  conf_path=${__conf_dir}/redis-${p}.conf

  data_dir=${__data_dir}/${p}
  mkdir -p ${data_dir}

  cp /redis.conf ${conf_path}
  echo "
port $p
dir ${data_dir}

cluster-announce-ip 127.0.0.1
" >> ${conf_path}

  echo "
[program:redis-${p}]
command=redis-server ${conf_path}
stdout_logfile=${__log_dir}/${p}-stdout.log
stderr_logfile=${__log_dir}/${p}-stderr.log
" >> /supervisord.conf
done

# Start Redis servers
supervisord -c /supervisord.conf
echo "redis server starting ...."
__FLAG=0
while [ ${__FLAG} -eq 0 ];
do
  sleep 1
  rm -f ${__listen_file}
  for p in 7000 7001 7002 7003 7004 7005
  do
    redis-cli -p ${p} ping >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "redis server :${p} started."
      echo -n "1" >> ${__listen_file}
    else
      echo "redis server :${p} no started."
      echo -n "0" >> ${__listen_file}
    fi
  done
  for p in 7000 7001 7002 7003 7004 7005
  do
    if [ -f ${__listen_file} -a "x`cat ${__listen_file}`" = "x111111" ]; then
      __FLAG=1
    fi
  done
done


echo ""
echo "======================================================"
echo "All redis server started up."
echo ""
echo -e "\tLocal Address\t${IPADDR}"
echo -e "\tRedis ports\t:7000 :7001 :7002 :7003 :7004 :7005"
echo -e "\tRedis announce ip\t:127.0.0.1"
echo -e "\tRedis announce ports\t:17000 :17001 :17002 :17003 :17004 :17005"
echo -e "\n\tex. redis-cli -c -p 7000\n"
echo "======================================================"
echo ""


# Create Redis cluster
if [ ! -f ${__lock_file} ]; then
  touch ${__lock_file}
  echo "yes" | /redis-trib.rb create --replicas 1 ${IPADDR}:7000 ${IPADDR}:7001 ${IPADDR}:7002 ${IPADDR}:7003 ${IPADDR}:7004 ${IPADDR}:7005
fi

tail -f ${__log_dir}/*.log