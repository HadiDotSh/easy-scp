#!/bin/bash
# Easy SCP
# By @HadiDotSh
# Usage : escp ${server name} ${send/receive} ${file/folder} ${destination}

known_server="${HOME}/.essh/known_server"
[[ -z ${*} ]] && printf "\e[0;91mx \e[0m\e[1;77mNo args.\e[0m\n" && exit
[[ ${1} == "help" ]] && printf "\e[1;93m? \e[0m\e[1;77mescp \${server name} \${send/receive} \${file/folder} \${destination}\e[0m\n" && exit

send(){
    username=${2}
    IP=${3}
    port=${4}
    rsa=${5}

    if [[ -d ${fileInput} && "${rsa}" == "true" ]];then
        scp -P 2002 -i ${6} -r ${fileInput} ${username}@${IP}:${destination}
    
    elif [[ -d ${fileInput} ]];then
        scp -P 2002 -r ${fileInput} ${username}@${IP}:${destination}

    elif [[ "${rsa}" == "true" ]];then
        scp -P 2002 -i ${6} ${fileInput} ${username}@${IP}:${destination}
        
    else
        scp -P 2002 ${fileInput} ${username}@${IP}:${destination}
    fi
}

receive(){
    username=${2}
    IP=${3}
    port=${4}
    rsa=${5}

    if [[ -d ${fileInput} && "${rsa}" == "true" ]];then
        scp -P 2002 -i ${6} -r ${username}@${IP}:${fileInput} ${destination}
    
    elif [[ -d ${fileInput} ]];then
        scp -P 2002 -r ${username}@${IP}:${fileInput} ${destination}

    elif [[ "${rsa}" == "true" ]];then
        scp -P 2002 -i ${6} ${username}@${IP}:${fileInput} ${destination}
    else
        scp -P 2002 ${username}@${IP}:${fileInput} ${destination}
    fi
}

serverName="$1" && shift && server=$( cat "${known_server}" | grep "^${serverName} " )

if [[ "${1}" == "send" ]];then
    method="send" 
    shift

elif [[ "${1}" == "receive" ]];then
    method="receive" 
    shift

else
    printf "\e[0;91mx \e[0m\e[1;77mError, please specify send or receive.\e[0m\n"
    exit
fi

fileInput="$1"
destination="$2"

if [[ ! -z "${server}" && ${method} == "send" ]];then
    send ${server}

elif [[ ! -z "${server}" && ${method} == "receive" ]];then
    receive ${server}

else
    printf "\e[0;91mx \e[0m\e[1;77m${serverName} Not Found\e[0m\n"
fi



