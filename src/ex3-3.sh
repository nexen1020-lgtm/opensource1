#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "사용법: $0 <과목1점수> <과목2점수> ..."
    exit 1
fi

SCORES=("$@")
SUM=0
COUNT=${#SCORES[@]}

echo "=== 과목별 성적 및 등급 ==="
idx=1
for score in "${SCORES[@]}"; do
    SUM=$((SUM + score))
    
    # 90점 이상인지 미만인지에 따라 등급 판정
    if [ "$score" -ge 90 ]; then
        grade="A"
    else
        grade="B"
    fi
    
    # 출력 문구가 if문 바깥에 있어야 모든 과목이 정상적으로 출력됩니다!
    echo "과목 $idx: 점수 = $score, 등급 = $grade"
    
    idx=$((idx + 1))
done

# 평균 계산 (bc 이용)
AVG=$(echo "scale=2; $SUM / $COUNT" | bc)

if [ $(echo "$AVG >= 90" | bc) -eq 1 ]; then
    AVG_GRADE="A"
else
    AVG_GRADE="B"
fi

echo "------------------------"
echo "평균 점수: $AVG"
echo "평균 등급: $AVG_GRADE"

