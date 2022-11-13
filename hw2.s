	.intel_syntax noprefix
	.text                           # Начинает секцию.
	.local	C                       # Объявляем символ A, но не экспортируем его
	.comm	C,40,32                 # Неинициализированный массив (строка) начальный размер n (задаем сами)
	.globl	digits_count            # Объявляем и экспортируем вовне символ `digits_count`
	.type	digits_count, @function     # Отмечаем, что digits_count это функция
digits_count:                       # Начинается функция подсчета различных цифр в строке
	endbr64
	push	rbp                     # / Пролог функции (1/3). Сохранили предыдущий rbp на стек
	mov	rbp, rsp                    # | Пролог функции (2/3). Вместо rbp записали rsp
	push	rbx                     
	sub	rsp, 40                     # \ Пролог функции (3/3). А сам rsp сдвинули на 40 байт
	mov	QWORD PTR -40[rbp], rdi     # rbp[-40] := rdi
	mov	DWORD PTR -20[rbp], 0       # rbp[-20] := 0
	jmp	.L2                         # Переход к метке .L2
.L13:
	mov	eax, DWORD PTR -20[rbp]     # eax := rbp[-20]
	
	movsx	rdx, eax                # Комментарий сайта "sysprog.ru"
	                                # Команда "MOVSX" позволяет скопировать данные из источника
	                                # (второй операнд) меньшего размера в приемник (первый операнд)
	                                # большего размера.Результат будет дополнен битами таким образом,
	                                # чтобы сохранить знак источника.
	                                
	mov	rax, QWORD PTR -40[rbp]     # rax := rbp[-40]
	add	rax, rdx                    # rax += rdx
	
	movzx	eax, BYTE PTR [rax]     # Комментарий сайта "sysprog.ru"
	                                # Команда "MOVZX" позволяет скопировать данные из источника
	                                # (второй операнд) меньшего размера в приемник
	                                # (первый операнд) большего размера.
	                                # Результат будет дополнен нулевыми битами.
	                                
	cmp	al, 48                      # Сравнение символа из строки с 0 (ASSCII код цифры 0 - 48)
	
	jne	.L3                         # Проверяется бит нуля (Z) регистра статуса.
	                                # Если он сброшен, 10-разрядная величина смещения со знаком,
	                                # содержащаяся в младших битах (LSB) команды прибавляется к
	                                # счетчику команд. Если бит Z установлен,
	                                # выполняется команда, следующая за инструкцией jump.    
	                                
	mov	eax, DWORD PTR C[rip]       # eax := C[rip]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip], eax
.L3:
	mov	eax, DWORD PTR -20[rbp]     # eax := rbp[-20]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]     # rax := rbp[-40]
	add	rax, rdx                    # rax += rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 49                      # Сравнение символа из строки с 1 (ASSCII код цифры 1 - 49)
	jne	.L4
	mov	eax, DWORD PTR C[rip+4]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip+4], eax
.L4:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx                    # rax += rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 50                      # Сравнение символа из строки с 2 (ASSCII код цифры 2 - 50)
	jne	.L5
	mov	eax, DWORD PTR C[rip+8]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip+8], eax
.L5:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx                    # rax += rdx                    
	movzx	eax, BYTE PTR [rax]
	cmp	al, 51                      # Сравнение символа из строки с 3 (ASSCII код цифры 3 - 51)
	jne	.L6
	mov	eax, DWORD PTR C[rip+12]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip+12], eax
.L6:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx                    # rax += rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 52                      # Сравнение символа из строки с 4 (ASSCII код цифры 4 - 52)
	jne	.L7
	mov	eax, DWORD PTR C[rip+16]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip+16], eax
.L7:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx                    # rax += rdx                    
	movzx	eax, BYTE PTR [rax]
	cmp	al, 53                      # Сравнение символа из строки с 5 (ASSCII код цифры 5 - 53)
	jne	.L8
	mov	eax, DWORD PTR C[rip+20]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip+20], eax
.L8:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx                    # rax += rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 54                      # Сравнение символа из строки с 6 (ASSCII код цифры 6 - 54)
	jne	.L9
	mov	eax, DWORD PTR C[rip+24]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip+24], eax
.L9:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx                    # rax += rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 55                      # Сравнение символа из строки с 7 (ASSCII код цифры 7 - 55)
	jne	.L10
	mov	eax, DWORD PTR C[rip+28]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip+28], eax
.L10:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx                    # rax += rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 56                      # Сравнение символа из строки с 8 (ASSCII код цифры 8 - 56)
	jne	.L11
	mov	eax, DWORD PTR C[rip+32]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip+32], eax
.L11:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx                    # rax += rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57                      # Сравнение символа из строки с 9 (ASSCII код цифры 3 - 57)
	jne	.L12
	mov	eax, DWORD PTR C[rip+36]
	add	eax, 1                      # eax += 1
	mov	DWORD PTR C[rip+36], eax
.L12:
	add	DWORD PTR -20[rbp], 1       # rbp[-20] += 1
.L2:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rbx, eax
	mov	rdi, QWORD PTR -40[rbp]
	call	strlen@PLT
	cmp	rbx, rax                    # сравнить rbx и rax
	
	jb	.L13                        # Комментарий с сайта "av-assembler.ru"
	                                # Инструкция JB выполняет короткий переход, если первый операнд МЕНЬШЕ
	                                # второго операнда при выполнении операции сравнения
	                                # с помощью команды CMP.
	                                
	lea	rdi, C[rip]                 # rdi := &rip[C]
	call	print_result            # вызов функции print_result
	
	nop                             # Комментарий с сайта "av-assembler.ru"
	                                # nop, в основном, используется для выполнения небольшой
	                                # задержки в программе. Если говорить о микроконтроллерах, то такая
	                                # задержка может потребоваться, например, для подавления “дребезга контактов”.
	                                
	add	rsp, 40                     # rsp += 40
	pop	rbx
	pop	rbp
	ret
	.size	digits_count, .-digits_count
	.section	.rodata
	.align 8
.LC0:
	.string	"\320\232\320\276\320\273\320\270\321\207\320\265\321\201\321\202\320\262\320\276 : %d - %d\n" # Вывод количества различных цифр в C коде выглядит вот так:
	                                                                                                       # printf("Количество : %d - %d\n",i,C[i]);
	.align 8
.LC1:
	.string	"\320\224\321\200\321\203\320\263\320\270\321\205 \321\206\320\270\321\204\321\200 \320\262 \321\201\321\202\321\200\320\276\320\272\320\265 \320\275\320\265\321\202" # printf("Других цифр в строке нет");
	.text                               # Секция с кодом.
	.globl	print_result                # Объявляем и экспортируем вовне символ `print_result`
	.type	print_result, @function     # Отмечаем, что print_result это функция
print_result:                           # Начинается функция вывода кол-ва различных цифр.
	endbr64
	push	rbp                         # / Пролог функции (1/3). Сохранили предыдущий rbp на стек
	mov	rbp, rsp                        # | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 32                         # \ Пролог функции (3/3). А сам rsp сдвинули на 32 байтa
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -8[rbp], 0
	mov	r12d, 0
	jmp	.L15                            # Переход к метке .L15
.L17:
	mov	eax, r12d
	lea	rdx, 0[0+rax*4]                 # rdx := rax * 4 вычисляет адрес (rax*4)[0], который равен rax*4
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx                        # rax += rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jle	.L16                            # Комментарий с сайта "av-assembler.ru"                            
	                                    # Команда JLE выполняет короткий переход, если первый операнд МЕНЬШЕ
	                                    # второго операнда или РАВЕН ему при выполнении
	                                    # операции сравнения с помощью команды CMP.
	mov	eax, r12d
	lea	rdx, 0[0+rax*4]                 # rdx := rax * 4 вычисляет адрес (rax*4)[0], который равен rax*4
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx                        # rax += rdx
	mov	edx, DWORD PTR [rax]
	mov	esi, r12d
	lea	rdi, .LC0[rip]                  # rdi := &rip[.LCO]
	mov	eax, 0
	call	printf@PLT                  # вызов printf
.L16:
	add r12d, 1                         # r12d += 1
.L15:
	cmp r12d, 9                         # сравнить r12d и 9
	jle	.L17
	lea	rdi, .LC1[rip]                  # rdi := &rip[.LC1]
	mov	eax, 0
	call	printf@PLT                  # вызов printf
	nop
	leave                               # / Эпилог (1/2)
	ret                                 # \ Эпилог (2/2)
	.size	print_result, .-print_result
	.section	.rodata
	.align 8
.LC2:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\277\320\265\321\200\320\262\320\276\320\275\320\260\321\207\320\260\320\273\321\214\320\275\321\213\320\271 \321\200\320\260\320\267\320\274\320\265\321\200 \321\201\321\202\321\200\320\276\320\272\320\270: "
	        # printf("Введите первоначальный размер строки: ");
.LC3:
	.string	"%d"
.LC4:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\201\321\202\321\200\320\276\320\272\321\203: " # printf("Введите строку: ");
.LC5:
	.string	"%s"
	.text                           # Секция с кодом.
	.globl	main                    # Объявляем и экспортируем вовне символ `main`
	.type	main, @function         # Отмечаем, что main это функция
main:                               # Начинается функция main
	endbr64
	push	rbp                     # / Пролог функции (1/3). Сохранили предыдущий rbp на стек
	mov	rbp, rsp                    # | Пролог функции (2/3). Вместо rbp записали rsp.
	push	r15                     # Сохранили r15 на стек
	push	r14                     # Сохранили r14 на стек
	push	r13                     # Сохранили r13 на стек
	push	r12                     # Сохранили r12 на стек
	push	rbx                     # Сохранили rbx на стек
	sub	rsp, 56                     # \ Пролог функции (3/3). А сам rsp сдвинули на 56 байтов
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	mov	rbx, rsp
	lea	rdi, .LC2[rip]              # rdi := &rip[.LC2]
	mov	eax, 0
	call	printf@PLT              # вызов printf
	lea	rax, -68[rbp]               # rax := rbp[-68]
	mov	rsi, rax
	lea	rdi, .LC3[rip]              # rdi := &rip[.LC3]
	mov	eax, 0
	call	__isoc99_scanf@PLT      # scanf("%d", &rbp[-12])
	mov	eax, DWORD PTR -68[rbp]
	movsx	rdx, eax
	sub	rdx, 1                      # rdx сдвинули на 1 байт
	mov	QWORD PTR -56[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	mov	edx, 16
	sub	rdx, 1                      # rdx сдвинули на 1 байт
	add	rax, rdx                    # rax += rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16               # Комментарий с сайта "sysprog.ru"              
	                                   # Команда выполняет умножение второго
	                                   # операнда на третий операнд и
	                                   # помещает результат в первый операнд.
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L19:
	cmp	rsp, rdx                        # сравнить rsp и rdx
	je	.L20                            # Комментарий с сайта "av-assembler.ru"  
	                                    # Инструкция JE выполняет короткий переход, если первый операнд РАВЕН
	                                    # второму операнду при выполнении операции
	                                    # сравнения с помощью команды CMP.
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L19                            # Переход к метке .L19
.L20:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L21
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp                            # rax += rsp
	or	QWORD PTR [rax], 0
.L21:
	mov	rax, rsp
	add	rax, 0                              # rax += 0
	mov	QWORD PTR -64[rbp], rax
	lea	rdi, .LC4[rip]                      # rdi := &rip[.LC4]
	mov	eax, 0
	call	printf@PLT                      # вызов printf
	mov	rsi, QWORD PTR -64[rbp]
	lea	rdi, .LC5[rip]                      # rdi := &rip[.LC5]
	mov	eax, 0
	call	__isoc99_scanf@PLT              # scanf("%d", &rbp[-12])
	mov	rdi, QWORD PTR -64[rbp]
	call	digits_count                    # вызов функции digits_count
	mov	eax, 0
	mov	rsp, rbx
	lea	rsp, -40[rbp]                       # rsp := rbp[-40]
	pop	rbx                                 # Комментарий сайта "sysprog.ru"
	                                        # Команда POP копирует содержимое ячейки памяти
	                                        # по адресу SS:SP в операнд и увеличивает
	                                        # значение регистра стека на размер операнда (2 или 4).
	                                        # Если операнд использует регистр SP для косвенной адресации,
	                                        # команда POP вычисляет адрес уже после того, как она увеличивает SP.
	                                        # Если команда выполняется в 32-разрядном режиме, то используется регистр ESP.
	
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret                                     # Эпилог
