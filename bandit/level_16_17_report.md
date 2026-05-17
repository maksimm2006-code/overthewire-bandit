1. Цель задачи
На уровне Bandit 16 требуется найти порт в диапазоне 31000–32000 на локальном хосте (localhost), который:
•	Поддерживает SSL/TLS.
•	При отправке текущего пароля (уровня 16) возвращает приватный SSH-ключ для пользователя bandit17.
•	С помощью этого ключа необходимо подключиться к bandit17 и получить пароль следующего уровня.
Задача развивает навыки сканирования портов, работы с SSL, фильтрации вывода и автоматизации.
2. Ручное решение с использованием
2.1. Сканирование портов с определением SSL
Вместо обычного nmap -p 31000-32000 localhost (который показывает все открытые порты, независимо от протокола) используем скрипт ssl-cert. Этот скрипт пытается установить SSL-соединение и получить сертификат. Если это удаётся – порт точно поддерживает SSL.
nmap --script ssl-cert -p 31000-32000 localhost

2.3. Проверка портов на возврат ключа
Теперь нужно выяснить, какой из SSL-портов возвращает приватный ключ после отправки пароля. Проверяем каждый порт, например, 31518:
openssl s_client -connect localhost:31518 -ign_eof
Сервер ответил KEYUPDATE, получается порт 31518 не подходит
Порт 31790:
openssl s_client -connect localhost:31790 -ign_eof
Сервер напечатал приватный пароль от следующего уровня. Порт 31790 подходит

2.4. Сохранение ключа и подключение к bandit17
Копируем полученный ключ в файл:
nano sshkey17.private
chmod 600 sshkey17.private

Подключаемся к bandit17 через localhost:
ssh -i sshkey17.private bandit17@localhost -p 2220

3. Автоматизация решения
Для полной автоматизации напишем скрипт, который:
•	Принимает пароль уровня 16 и диапазон портов.
•	Через sshpass подключается к bandit16 и выполняет на сервере команды.
•	Использует nmap --script ssl-cert для фильтрации SSL-портов.
•	Перебирает найденные порты, отправляет пароль, извлекает ключ.
•	Подключается к bandit17 по полученному ключу.

Скрипт можно найти в scripts

4. Выводы
•	Использование nmap --script ssl-cert значительно упрощает ручное решение, сокращая количество проверяемых портов.
•	Скрипт автоматизации полностью повторяет логику ручного решения, но выполняется быстрее и без вмешательства пользователя.
•	Полученные навыки (сканирование портов, SSL-соединения, фильтрация вывода, heredoc, sshpass) применимы в других задачах OverTheWire и реальных сценариях администрирования.




English version

1. Task Objective
At Bandit level 16, you need to find a port in the range 31000–32000 on the local host (localhost) that:
• Supports SSL/TLS.
• When submitting the current password (level 16), returns a private SSH key for user bandit17.
• Using this key, connect to bandit17 and obtain the password for the next level.
This task develops skills in port scanning, working with SSL, output filtering, and automation.
2. Manual Solution Using
2.1. Port Scanning with SSL Detection
Instead of the usual nmap -p 31000-32000 localhost (which shows all open ports, regardless of protocol), we use the ssl-cert script. This script attempts to establish an SSL connection and obtain a certificate. If this succeeds, the port definitely supports SSL. nmap --script ssl-cert -p 31000-32000 localhost

2.3. Checking Ports for Key Returns
Now we need to determine which SSL port returns the private key after sending the password. We check each port, for example, 31518:
openssl s_client -connect localhost:31518 -ign_eof
The server responded with KEYUPDATE, so port 31518 is invalid.
Port 31790:
openssl s_client -connect localhost:31790 -ign_eof
The server printed the private password for the next level. Port 31790 is valid.

2.4. Saving the key and connecting to bandit17
Copy the resulting key to a file:
nano sshkey17.private
chmod 600 sshkey17.private

Connect to bandit17 via localhost:
ssh -i sshkey17.private bandit17@localhost -p 2220

3. Automating the solution
For full automation, we'll write a script that:
• Accepts a level 16 password and a port range.
• Connects to bandit16 via sshpass and executes commands on the server.
• Uses nmap --script ssl-cert to filter SSL ports.
• Tries through the found ports, sends the password, and extracts the key.
• Connects to bandit17 using the received key.

The script can be found in scripts.

4. Conclusions
• Using nmap --script ssl-cert significantly simplifies the manual solution by reducing the number of ports checked.
• The automated script completely replicates the logic of the manual solution, but runs faster and without user intervention.
• The skills learned (port scanning, SSL connections, output filtering, heredoc, sshpass) are applicable to other OverTheWire tasks and real-world administration scenarios.

