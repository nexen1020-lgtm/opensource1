#!/bin/bash

SCORES=()

while true; do
    echo "------------------------"
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "------------------------"
    echo -n "메뉴를 선택하세요 [1-5]: "
    read choice

    case $choice in
        1)
            echo -n "추가할 점수를 입력하세요: "
            read score
            SCORES+=("$score")
            echo "성적이 추가되었습니다."
            ;;
        2)
            echo "입력된 모든 점수: ${SCORES[*]}"
            ;;
        3)
            if [ ${#SCORES[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                sum=0
                for s in "${SCORES[@]}"; do
                    sum=$((sum + s))
                done
                avg=$(echo "scale=2; $sum / ${#SCORES[@]}" | bc)
                echo "평균 점수: $avg"
            fi
            ;;
        4)
            if [ ${#SCORES[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                sum=0
                for s in "${SCORES[@]}"; do
                    sum=$((sum + s))
                done
                avg=$(echo "scale=2; $sum / ${#SCORES[@]}" | bc)
                if [ $(echo "$avg >= 90" | bc) -eq 1 ]; then
                    echo "평균 등급: A (평균: $avg)"
                else
                    echo "평균 등급: B (평균: $avg)"
                fi
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "잘못된 선택입니다. 1~5 사이를 입력하세요."
            ;;
    esac
done

