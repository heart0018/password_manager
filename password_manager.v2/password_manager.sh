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
gpg -c password_manager.text

elif [ "$choice" = "Get Password" ]; then
echo "サービス名を入力してください"
read num4
while true; do
num5=$(gpg -d password_manager.text.gpg | grep -A 2 "$num4")
if [ -z "$num5" ]; then
echo "そのサービスは登録されていません"
break
else
echo "$num5"
break
fi
echo
done

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

