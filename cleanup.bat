@echo off
echo --- Очистка истории Git и удаление секретов ---
REM Запускаем BFG для удаления .env из истории
java -jar bfg-1.15.0.jar --delete-files .env

echo --- Очистка кеша Git ---
git reflog expire --expire=now --all
git gc --prune=now --aggressive

echo --- Форс-пуш изменений в GitHub ---
git push origin master --force

echo --- Готово! История очищена и пуш выполнен. ---
pause
