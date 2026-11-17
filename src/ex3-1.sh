#!/bin/bash

# 인자가 2개 전달되었는지 확인
if [ "$#" -ne 2 ]; then
    echo "사용법: $0 <숫자1> <숫자2>"
    exit 1
fi

NUM1=$1
NUM2=$2

echo "=== 사칙연산 결과 ==="
echo "입력된 숫자: $NUM1, $NUM2"
echo "덧셈: $NUM1 + $NUM2 = $((NUM1 + NUM2))"
echo "뺄셈: $NUM1 - $NUM2 = $((NUM1 - NUM2))"
echo "곱셈: $NUM1 * $NUM2 = $((NUM1 * NUM2))"

# 0으로 나누기 예외 처리
if [ "$NUM2" -eq 0 ]; then
    echo "나눗셈: 0으로 나눌 수 없습니다."
else
    echo "나눗셈: $NUM1 / $NUM2 = $((NUM1 / NUM2))"
fi

