#!/bin/bash

# 1. .bashrc 파일에 환경변수 등록 (중복 등록 방지를 위해 기존에 없을 때만 추가)
if ! grep -q "MYENV" ~/.bashrc; then
    echo 'export MYENV="Hello Shell"' >> ~/.bashrc
    echo ".bashrc에 MYENV 환경변수를 등록했습니다."
fi

# 2. 현재 설정 반영
source ~/.bashrc

# 3. 환경변수 값 확인
echo "현재 MYENV 값: $MYENV"

# 4. 환경변수 해제 테스트 (unset)
unset MYENV
echo "unset 이후 MYENV 값: '$MYENV' (해제되어 출력되지 않음)"

