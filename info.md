### CheckRule "$SQL >= 8" BLOCK;
Это правило блокирует запросы, содержащие подозрительные SQL-инъекции.
 Когда значение переменной $SQL превышает или равно 8, запрос блокируется. 
 Переменная $SQL увеличивается при обнаружении строк, которые могут указывать на попытку SQL-инъекции, таких как SELECT, INSERT, DELETE, DROP, UNION и т.д.

### CheckRule "$RFI >= 8" BLOCK;
Это правило блокирует запросы, содержащие подозрительные уязвимости включения удаленных файлов (RFI). 
Когда значение переменной $RFI превышает или равно 8, запрос блокируется. 
Переменная $RFI увеличивается при обнаружении строк, которые могут указывать на попытку RFI, таких как http://, https://, file://, include, require и т.д.

### CheckRule "$TRAVERSAL >= 4" BLOCK;
Это правило блокирует запросы, содержащие подозрительные попытки перебора каталогов (directory traversal).
Когда значение переменной $TRAVERSAL превышает или равно 4, запрос блокируется. 
Переменная $TRAVERSAL увеличивается при обнаружении строк, которые могут указывать на попытку перебора каталогов, таких как ../, ./, /etc/, /windows/ и т.д.

### CheckRule "$EVADE >= 4" BLOCK;
Это правило блокирует запросы, содержащие подозрительные попытки обхода системы безопасности (evasion).
Когда значение переменной $EVADE превышает или равно 4, запрос блокируется. 
Переменная $EVADE увеличивается при обнаружении строк, которые могут указывать на попытку обхода системы безопасности, таких как %00, %2f, %5c, \x, \0 и т.д.

### CheckRule "$XSS >= 8" BLOCK;
Это правило блокирует запросы, содержащие подозрительные попытки межсайтового исполнения скриптов (XSS). 
Когда значение переменной $XSS превышает или равно 100, запрос блокируется. 
Переменная $XSS увеличивается при обнаружении строк, которые могут указывать на попытку XSS, таких как <script>, </script>, onclick=, onmouseover=, javascript: и т.д.