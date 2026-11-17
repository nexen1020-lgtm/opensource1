#!/bin/bash

# 인자가 2개(이름, 정보) 전달되었는지 확인
if [ "$#" -ne 2 ]; then
    echo "사용법: $0 <이름> <전화번호/생일>"
    exit 1
fi

NAME=$1
INFO=$2

# 입력받은 이름과 정보를 DB.txt에 이어쓰기(추가)
echo "$NAME $INFO" >> DB.txt

echo "DB.txt에 기록되었습니다: $NAME $INFO"

