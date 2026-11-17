#!/bin/bash

# 인자가 없으면 기본값으로 "files" 사용
DIR_NAME=${1:-files}

# 1. 입력된 이름의 폴더 생성 및 이동
mkdir -p "$DIR_NAME"
cd "$DIR_NAME"

# 2. 5개의 파일 생성 (file0.txt ~ file4.txt) 및 하위 폴더 생성 후 링크 연결
for i in {0..4}; do
    # 원본 파일 생성
    echo "Content of file$i" > "file$i.txt"
    
    # 파일 이름과 동일한 하위 폴더 생성 (예: file0, file1 ...)
    mkdir -p "file$i"
    
    # 하위 폴더 안에 상위 폴더의 원본 파일을 가리키는 심볼릭 링크 생성
    ln -sf "../file$i.txt" "file$i/file$i.txt"
done

echo "ex3-7.sh 실행 완료: 폴더 및 심볼릭 링크 생성 성공!"

