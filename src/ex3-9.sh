#!/bin/bash

# 인자가 전달되었는지 확인
if [ "$#" -ne 1 ]; then
    echo "사용법: $0 <검색할 이름 또는 키워드>"
    exit 1
fi

KEYWORD=$1

# DB.txt 파일이 존재하는지 확인
if [ ! -f "DB.txt" ]; then
    echo "오류: DB.txt 파일이 존재하지 않습니다. (ex3-8.sh를 먼저 실행해주세요)"
    exit 1
fi

echo "=== '$KEYWORD' 검색 결과 ==="

# grep 명령어를 사용하여 DB.txt에서 키워드(이름 등)가 포함된 줄을 검색
grep -i "$KEYWORD" DB.txt

# 검색 결과가 있는지 확인
if [ $? -ne 0 ]; then
    echo "검색된 정보가 없습니다."
fi

