#!/bin/bash


while true; do

echo "パスワードマネージャーへようこそ！"
read -p  "次の選択肢から入力してください(Add Password/Get Password/Exit)" choice
if [ "$choice" = "Add Password" ]; then
 echo "サービス名を入力してください:"
read num1
echo "ユーザー名を入力してください:"
read num2
echo "パスワードを入力してください"
read num3
echo "サービス名:$num1" >> password_manager.text
echo "ユーザー名:$num2" >> password_manager.text
echo "パスワード:$num3" >> password_manager.text
echo 
echo "パスワードの追加は成功しました"
echo

elif [ "$choice" = "Get Password" ]; then
echo "サービス名を入力してください:"
read num4
serch_pattern="$num4"
found=false

while IFS= read -r line
do
if [[ "$line" == *"$serch_pattern"* ]]; then

grep -A 2 "$num4" password_manager.text
found=true
fi
done < password_manager.text
if ! $found; then
echo "そのサービスは登録されてません"
fi

elif [ "$choice" = "Exit" ]; then
echo "Thank you!"
exit 0
break
else
echo
echo "入力が間違えてます。Add Password/Get Password/Exit から入力してください"
echo
fi
done 


