#!/bin/bash

DIR_NAME=${1:-files}

# 1. 폴더 확인 및 생성
if [ ! -d "$DIR_NAME" ]; then
    mkdir "$DIR_NAME"
fi

# 2. 5개의 파일 생성 (file0.txt ~ file4.txt)
for i in {0..4}; do
    echo "This is file $i" > "file$i.txt"
done

# 3. 파일들 압축하기 (tar)
tar -cvf "${DIR_NAME}.tar" file0.txt file1.txt file2.txt file3.txt file4.txt

# 4. 새로운 폴더 안에서 압축 해제 테스트
mkdir -p "${DIR_NAME}/${DIR_NAME}"
cp "${DIR_NAME}.tar" "$DIR_NAME/"
cd "$DIR_NAME"
tar -xvf "${DIR_NAME}.tar"
cd ..

