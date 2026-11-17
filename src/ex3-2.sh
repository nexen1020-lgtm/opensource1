#!/bin/bash

# 인자가 전달되지 않은 경우 사용자로부터 직접 입력받기
if [ "$#" -eq 0 ]; then
    echo -n "스페이스바로 구분하여 x값을 2개 이상 입력하세요: "
    read -a X_VALUES
else
    X_VALUES=("$@")
fi

echo "=== y = 0.5 * x^2 계산 결과 ==="
for x in "${X_VALUES[@]}"; do
    # bc 명령어를 사용하여 실수 계산 수행 (0.5 * x * x)
    y=$(echo "scale=2; 0.5 * $x * $x" | bc)
    echo "x = $x 인 때, y = $y"
done

