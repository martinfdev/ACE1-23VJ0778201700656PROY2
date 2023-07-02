NADA        equ      00
JUGADOR     equ      01
PARED       equ      02
CAJA        equ      03
OBJETIVO    equ      04
SUELO       equ      05
.MODEL SMALL
.RADIX 16
.STACK
.DATA
dim_sprite_jug    db   08, 08
data_sprite_jug   db   5C, 5C, 5C, 28, 28, 28, 5C, 5C
                  db   5C, 5C, 5C, 54, 54, 5C, 5C, 5C
                  db   5C, 5C, 02, 02, 02, 02, 5C, 5C
                  db   5C, 54, 5C, 02, 02, 5C, 54, 5C
                  db   5C, 5C, 5C, 09, 09, 5C, 5C, 5C
                  db   5C, 5C, 5C, 09, 09, 5C, 5C, 5C
                  db   5C, 5C, 54, 5C, 5C, 54, 5C, 5C
                  db   5C, 00, 00, 5C, 5C, 00, 00, 5C
dim_sprite_flcha  db   08, 08
data_sprite_flcha   db   00, 00, 03, 00, 00, 00, 00, 00
                    db   00, 00, 03, 03, 00, 00, 00, 00
                    db   03, 03, 03, 03, 03, 00, 00, 00
                    db   03, 03, 03, 03, 03, 03, 00, 00
                    db   03, 03, 03, 03, 03, 03, 00, 00
                    db   03, 03, 03, 03, 03, 00, 00, 00
                    db   00, 00, 03, 03, 00, 00, 00, 00
                    db   00, 00, 03, 00, 00, 00, 00, 00
dim_sprite_vacio  db   08, 08
data_sprite_vacio db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
                  db   00, 00, 00, 00, 00, 00, 00, 00
dim_sprite_suelo  db   08, 08
data_sprite_suelo db   5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C
                  db   5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C
                  db   5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C
                  db   5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C
                  db   5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C
                  db   5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C
                  db   5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C
                  db   5C, 5C, 5C, 5C, 5C, 5C, 5C, 5C
dim_sprite_pared  db   08, 08
data_sprite_pared db   0F, 0F, 0F, 0F, 10, 0F, 0F, 72
                  db   72, 72, 72, 72, 10, 0F, 72, 72
                  db   72, 72, 72, 72, 10, 0F, 72, 72
                  db   72, 72, 72, 72, 10, 0F, 72, 72
                  db   10, 72, 72, 10, 72, 10, 10, 10
                  db   0F, 10, 10, 10, 72, 0F, 0F, 0F
                  db   72, 0F, 0F, 10, 72, 72, 72, 72
                  db   72, 72, 72, 0F, 10, 72, 72, 72
dim_sprite_caja   db   08, 08
data_sprite_caja  db  5C,5C,5C,5C,5C,5C,5C,5C
                  db  5C,5C,0b8,0b8,0b8,0b8,5C,5C
                  db  5C,0b8,8a,8a,8a,8a,0b8,5C
                  db  5C,0b8,8a,8a,8a,8a,0b8,5C
                  db  5C,0b8,8a,8a,8a,8a,0b8,5C
                  db  5C,0b8,8a,8a,8a,8a,0b8,5C
                  db  5C,5C,0b8,0b8,0b8,0b8,5C,5C
                  db  5C,5C,5C,5C,5C,5C,5C,5C
dim_sprite_obj    db   08, 08
data_sprite_obj   db  5C,5C,5C,5C,5C,5C,5C,5C
                  db  5C,28,5C,5C,5C,5C,28,5C
                  db  5C,5C,28,5C,5C,28,5C,5C
                  db  5C,5C,5C,28,28,5C,5C,5C
                  db  5C,5C,5C,28,28,5C,5C,5C
                  db  5C,5C,28,5C,5C,28,5C,5C
                  db  5C,28,5C,5C,5C,5C,28,5C
                  db  5C,5C,5C,5C,5C,5C,5C,5C
mapa              db   3e8 dup (0)
iniciar_juego db "INICIAR JUEGO$"
cargar_nivel  db "CARGAR NIVEL$"
configuracion db "CONFIGURACION$"
puntajes      db "PUNTAJES ALTOS$"
salir         db "SALIR$"
iniciales     db "P. Martin F. $"
carnet 		  db "201700656 $"
iniciales_pie  db "P.M.F. - 201700656$"
xJugador      db 0
yJugador      db 0
puntos        dw 0000
;; MENÚS
opcion        db 0
maximo        db 0
xFlecha       dw 0
yFlecha       dw 0
;; CONTROLES
control_arriba    db  48
control_abajo     db  50
control_izquierda db  4b
control_derecha   db  4d
;; NIVELES
nivel_x           db  "NIV.00",00 ;cabiar a leet entrada de teclado
handle_nivel      dw  0000
linea             db  100 dup (0)
elemento_actual   db  0
xElemento         db  0
yElemento         db  0
;; TOKENS
tk_pared      db  05,"pared"
tk_suelo      db  05,"suelo"
tk_jugador    db  07,"jugador"
tk_caja       db  04,"caja"
tk_objetivo   db  08,"objetivo"
tk_coma       db  01,","
;;
numero        db  5 dup (30)
hora          db  00
minuto        db  00
segundo       db  00
numero_ascii  db  02 dup (30), "$"
dos_puntos    db  ":$"
t_min_jueg_jug db 00
t_hora_jueg_jug db 00
numero_ascii_lenght5  db  05 dup (30), "$"
buffer_teclado		db 09, 00
					db 09 dup(0)
msg_pedir_nivel	db "Ingrese el Nivel: $"
nivel_precargado db 00 ;cambiar valor cada vez que se va ganando los niveles precargados
nivel_1			 db "NIV.00",00
nivel_2			 db "NIV.01",01
nivel_3			 db "NIV.10",02
.CODE
.STARTUP
inicio:
	;; MODO VIDEO ;;
	mov AH, 00
	mov AL, 13
	int 10
	call mensaje_inicial
		;;;;;;;;;;;;;;;;
	call menu_principal
	mov AL, [opcion]
	;; > INICIAR JUEGO
	cmp AL, 0
	je cargar_niveles_precargado
	;; > CARGAR NIVEL
	cmp AL, 1
	je cargar_un_nivel
	;; > CONFIGURACION
	;; > PUNTAJES ALTOS
	;; > SALIR
	cmp AL, 4
	je fin
	;;;;;;;;;;;;;;;;
ciclo_juego:
		call pintar_mapa
		call entrada_juego
		call pie_de_juego
		jmp ciclo_juego
		;;;;;;;;;;;;;;;;
;iniciar juego con niveles precargados
cargar_niveles_precargado:
	push AX
	push DX
	mov AX, 0000
	mov AL, [nivel_precargado]
	cmp AL, 00 ;nivel uno del juego
	je nivel_1_leer_archivo
	pop DX
	pop AX
	jmp inicio
nivel_1_leer_archivo:
	mov DX, offset nivel_x
	jmp cargar_nivel_precargado
	pop DX
	pop AX
	ret

cargar_nivel_precargado:
	mov AL, 00
	mov AH, 3d
	int 21
	jc inicio
	mov [handle_nivel], AX
	jmp ciclo_lineas

cargar_un_nivel:
		call clear_pantalla

		call obtener_nombre_archivo_nivel
		mov AL, 00
		mov DX, offset nivel_x
		mov AH, 3d
		int 21
		jc inicio
		mov [handle_nivel], AX
		;;
ciclo_lineas:
		mov BX, [handle_nivel]
		call siguiente_linea
		cmp DL, 0ff      ;; fin-del-archivo?
		je fin_parseo
		cmp DH, 00      ;; línea-con-algo?
		je ciclo_lineas
		;;;;;;;;;;;;;;;;;;;;;;;
		;; lógica del parseo ;;
		;;;;;;;;;;;;;;;;;;;;;;;
		;; al principio del buffer de la línea está: pared, caja, jugador, suelo, objetivo
		mov DI, offset linea
		push DI
		mov SI, offset tk_pared
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_pared
		pop DI
		push DI
		mov SI, offset tk_caja
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_caja
		pop DI
		push DI
		mov SI, offset tk_suelo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_suelo
		pop DI
		push DI
		mov SI, offset tk_objetivo
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_objetivo
		pop DI
		push DI
		mov SI, offset tk_jugador
		call cadena_igual
		cmp DL, 0ff               ;; cadenas iguales
		je es_jugador
		pop DI
		jmp ciclo_lineas
es_pared:
		mov AL, PARED
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_caja:
		mov AL, CAJA
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_suelo:
		mov AL, SUELO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_objetivo:
		mov AL, OBJETIVO
		mov [elemento_actual], AL
		jmp continuar_parseo0
es_jugador:
		mov AL, JUGADOR
		mov [elemento_actual], AL
		jmp continuar_parseo0
		;; ignorar espacios
continuar_parseo0:
		pop SI         ; ignorara valor inicial de DI
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [xElemento], AL
		pop DI
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		je continuar_parseo1
		cmp AL, ','
		je continuar_parseo2
		jmp ciclo_lineas
continuar_parseo1:
		;; ignorar espacios
		call ignorar_espacios
continuar_parseo2:
		;; obtener una coma
		mov SI, offset tk_coma
		call cadena_igual
		cmp DL, 0ff
		jne ciclo_lineas
		;; ignorar espacios
		mov AL, [DI]
		cmp AL, 20
		jne ciclo_lineas
		call ignorar_espacios
		;; obtener una cadena numérica
		call leer_cadena_numerica
		push DI
		mov DI, offset numero
		call cadenaAnum
		mov [yElemento], AL
		pop DI
		;; ignorar_espacios
		mov AL, [DI]
		cmp AL, 20
		jne ver_final_de_linea
		call ignorar_espacios
		;; ver si es el final de la cadena
ver_final_de_linea:
		mov AL, [DI]
		cmp AL, 00
		jne ciclo_lineas
		;; usar la información
		;;
		mov DL, [elemento_actual]
		mov AH, [xElemento]
		mov AL, [yElemento]
		call colocar_en_mapa
		mov AL, JUGADOR
		cmp AL, [elemento_actual]
		je guardar_coordenadas_jugador
		jmp ciclo_lineas
guardar_coordenadas_jugador:
		mov AH, [xElemento]
		mov AL, [yElemento]
		mov [xJugador], AH
		mov [yJugador], AL
		jmp ciclo_lineas
		;;;;;;;;;;;;;;;;;;;;;;;
fin_parseo:
		;; cerrar archivo
		mov AH, 3e
		mov BX, [handle_nivel]
		int 21
		;;
		int 03
		jmp ciclo_juego
		jmp fin

;; pintar_pixel - pintar un pixel
;; ENTRADA:
;;     AX --> x pixel
;;     BX --> y pixel
;;     CL --> color
;; SALIDA: pintar pixel
;; AX + 320*BX
pintar_pixel:
		push AX
		push BX
		push CX
		push DX
		push DI
		push SI
		push DS
		mov DX, 0a000
		mov DS, DX
		;; (
		;; 	posicionarse en X
		mov SI, AX
		mov AX, 140
		mul BX
		add AX, SI
		mov DI, AX
		;;
		mov [DI], CL  ;; pintar
		;; )
		pop DS
		pop SI
		pop DI
		pop DX
		pop CX
		pop BX
		pop AX
		ret

;; pintar_sprite - pinta un sprite
;; Entrada:
;;    - DI: offset del sprite
;;    - SI: offset de las dimensiones
;;    - AX: x sprite 320x200
;;    - BX: y sprite 320x200
pintar_sprite:
		push DI
		push SI
		push AX
		push BX
		push CX
		inc SI
		mov DH, [SI]  ;; vertical
		dec SI        ;; dirección de tam horizontal
		;;
inicio_pintar_fila:
		cmp DH, 00
		je fin_pintar_sprite
		push AX
		mov DL, [SI]
pintar_fila:
		cmp DL, 00
		je pintar_siguiente_fila
		mov CL, [DI]
		call pintar_pixel
		inc AX
		inc DI
		dec DL
		jmp pintar_fila
pintar_siguiente_fila:
		pop AX
		inc BX
		dec DH
		jmp inicio_pintar_fila
fin_pintar_sprite:
		pop CX
		pop BX
		pop AX
		pop SI
		pop DI
		ret

;; delay - subrutina de retardo
delay:
		push SI
		push DI
		mov SI, 10
cicloA:
		mov DI, 0130
		dec SI
		cmp SI, 0000
		je fin_delay
cicloB:
		dec DI
		cmp DI, 0000
		je cicloA
		jmp cicloB
fin_delay:
		pop DI
		pop SI
		ret


;; clear_pantalla - limpia la pantalla
;; ..
;; ..
clear_pantalla:
		mov CX, 19  ;; 25
		mov BX, 00
clear_v:
		push CX
		mov CX, 28  ;; 40
		mov AX, 00
clear_h:
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		add AX, 08
		loop clear_h
		add BX, 08
		pop CX
		loop clear_v
		ret

mensaje_inicial:
	call clear_pantalla
	push DX
	;tiempo de sistema actual
	mov DL, 0F
	mov DH, 0A
	mov BH, 00
	mov AH, 02
	int 10

	mov DX, offset iniciales
	mov AH, 09
	int 21

	mov DL, 0F
	mov DH, 0C
	mov BH, 00
	mov AH, 02
	int 10

	mov DX, offset carnet
	mov AH, 09
	int 21

	call delay
	pop DX
	ret
;; menu_principal - menu principal
;; ..
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
menu_principal:
		call clear_pantalla
		mov AL, 0
		mov [opcion], AL      ;; reinicio de la variable de salida
		mov AL, 5
		mov [maximo], AL
		mov AX, 50
		mov BX, 28
		mov [xFlecha], AX
		mov [yFlecha], BX
		;; IMPRIMIR OPCIONES ;;
		;;;; INICIAR JUEGO
		mov DL, 0c
		mov DH, 05
		mov BH, 00
		mov AH, 02
		int 10
		;; <<-- posicionar el cursor
		push DX
		mov DX, offset iniciar_juego
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CARGAR NIVEL
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset cargar_nivel
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; PUNTAJES ALTOS
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset puntajes
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CONFIGURACION
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset configuracion
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; SALIR
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir
		mov AH, 09
		int 21
		pop DX
		;;;;
		call pintar_flecha
		;;;;
		;; LEER TECLA
		;;;;
entrada_menu_principal:
		mov AH, 00
		int 16
		cmp AH, 48
		je restar_opcion_menu_principal
		cmp AH, 50
		je sumar_opcion_menu_principal
		cmp AH, 3b  ;; le doy F1
		je fin_menu_principal
		jmp entrada_menu_principal
restar_opcion_menu_principal:
		mov AL, [opcion]
		dec AL
		cmp AL, 0ff
		je volver_a_cero
		mov [opcion], AL
		jmp mover_flecha_menu_principal
sumar_opcion_menu_principal:
		mov AL, [opcion]
		mov AH, [maximo]
		inc AL
		cmp AL, AH
		je volver_a_maximo
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_cero:
		mov AL, 0
		mov [opcion], AL
		jmp mover_flecha_menu_principal
volver_a_maximo:
		mov AL, [maximo]
		dec AL
		mov [opcion], AL
		jmp mover_flecha_menu_principal
mover_flecha_menu_principal:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		mov AX, 50
		mov BX, 28
		mov CL, [opcion]
ciclo_ubicar_flecha_menu_principal:
		cmp CL, 0
		je pintar_flecha_menu_principal
		dec CL
		add BX, 10
		jmp ciclo_ubicar_flecha_menu_principal
pintar_flecha_menu_principal:
		mov [xFlecha], AX
		mov [yFlecha], BX
		call pintar_flecha
		jmp entrada_menu_principal
		;;
fin_menu_principal:
		ret

;; pintar_flecha - pinta una flecha
pintar_flecha:
		mov AX, [xFlecha]
		mov BX, [yFlecha]
		mov SI, offset dim_sprite_flcha
		mov DI, offset data_sprite_flcha
		call pintar_sprite
		ret

;; adaptar_coordenada - 40x25->320x200
;; ENTRADA:
;;    AH -> x 40x25
;;    AL -> y 40x25
;; SALIDA:
;;    AX -> x 320x200
;;    BX -> y 320x200
adaptar_coordenada:
		mov DL, 08
		mov CX, AX
		mul DL
		mov BX, AX
		;;
		mov AL, CH
		mul DL
		ret

;; colocar_en_mapa - coloca un elemento en el mapa
;; ENTRADA:
;;    - DL -> código numérico del elemento
;;    - AH -> x
;;    - AL -> y
;; ...
colocar_en_mapa:
		mov CX, AX     ;;;   AH -> x -> CH
		mov BL, 28
		mul BL   ;; AL * BL  = AX
		mov CL, CH
		mov CH, 00     ;;; CX el valor de X completo
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov [DI], DL
		ret


;; obtener_de_mapa - obtiene un elemento en el mapa
;; ENTRADA:
;;    - AH -> x
;;    - AL -> y
;; SALIDA:
;;    - DL -> código numérico del elemento
obtener_de_mapa:
		mov CX, AX
		mov BL, 28
		mul BL
		mov CL, CH
		mov CH, 00
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov DL, [DI]
		ret


;; pintar_mapa - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_mapa:
		mov AL, 01   ;; fila
		;;
ciclo_v:
		cmp AL, 1A
		je fin_pintar_mapa
		mov AH, 00   ;; columna
		;;
ciclo_h:
		cmp AH, 28
		je continuar_v
		push AX
		call obtener_de_mapa
		pop AX
		;;
                cmp DL, NADA
		je pintar_vacio_mapa
		;;
                cmp DL, JUGADOR
		je pintar_jugador_mapa
		;;
                cmp DL, PARED
		je pintar_pared_mapa
		;;
                cmp DL, CAJA
		je pintar_caja_mapa
		;;
                cmp DL, OBJETIVO
		je pintar_objetivo_mapa
		;;
                cmp DL, SUELO
		je pintar_suelo_mapa
		;;
		jmp continuar_h
pintar_vacio_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_suelo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_suelo
		mov DI, offset data_sprite_suelo
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_jugador_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug
		mov DI, offset data_sprite_jug
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_pared_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_pared
		mov DI, offset data_sprite_pared
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_caja_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_caja
		mov DI, offset data_sprite_caja
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_objetivo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_obj
		mov DI, offset data_sprite_obj
		call pintar_sprite
		pop AX
		jmp continuar_h
continuar_h:
		inc AH
		jmp ciclo_h
continuar_v:
		inc AL
		jmp ciclo_v
fin_pintar_mapa:
		ret


;; mapa_quemado - mapa de prueba
; mapa_quemado:
; 		mov DL, SUELO
; 		mov AH, 2
; 		mov AL, 2
; 		call colocar_en_mapa
; 		mov DL, SUELO
; 		mov AH, 3
; 		mov AL, 2
; 		call colocar_en_mapa
; 		mov DL, SUELO
; 		mov AH, 4
; 		mov AL, 2
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 2
; 		mov AL, 3
; 		call colocar_en_mapa
; 		mov DL, SUELO
; 		mov AH, 3
; 		mov AL, 3
; 		call colocar_en_mapa
; 		mov DL, SUELO
; 		mov AH, 4
; 		mov AL, 3
; 		call colocar_en_mapa
; 		mov DL, SUELO
; 		mov AH, 2
; 		mov AL, 4
; 		call colocar_en_mapa
; 		mov DL, SUELO
; 		mov AH, 3
; 		mov AL, 4
; 		call colocar_en_mapa
; 		mov DL, SUELO
; 		mov AH, 4
; 		mov AL, 4
; 		call colocar_en_mapa
; 		;;
; 		mov DL, JUGADOR
; 		mov AH, [xJugador]
; 		mov AL, [yJugador]
; 		call colocar_en_mapa
; 		;;
; 		mov DL, CAJA
; 		mov AH, 2
; 		mov AL, 3
; 		call colocar_en_mapa
; 		;;
; 		mov DL, OBJETIVO
; 		mov AH, 4
; 		mov AL, 2
; 		call colocar_en_mapa
; 		;;
; 		mov DL, PARED
; 		mov AH, 1
; 		mov AL, 1
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 2
; 		mov AL, 1
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 3
; 		mov AL, 1
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 4
; 		mov AL, 1
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 5
; 		mov AL, 1
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 1
; 		mov AL, 2
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 5
; 		mov AL, 2
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 1
; 		mov AL, 3
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 5
; 		mov AL, 3
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 1
; 		mov AL, 4
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 5
; 		mov AL, 4
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 1
; 		mov AL, 5
; 		call colocar_en_mapa

; 		mov DL, PARED
; 		mov AH, 2
; 		mov AL, 5
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 3
; 		mov AL, 5
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 4
; 		mov AL, 5
; 		call colocar_en_mapa
; 		mov DL, PARED
; 		mov AH, 5
; 		mov AL, 5
; 		call colocar_en_mapa
; 		ret


;; entrada_juego - manejo de las entradas del juego
entrada_juego:
		mov AH, 01
		int 16
		jz fin_entrada_juego  ;; nada en el buffer de entrada
		mov AH, 00
		int 16
		;; AH <- scan code
		cmp AH, [control_arriba]
		je mover_jugador_arr
		cmp AH, [control_abajo]
		je mover_jugador_aba
		cmp AH, [control_izquierda]
		je mover_jugador_izq
		cmp AH, [control_derecha]
		je mover_jugador_der
		cmp AH, 3c
		ret
mover_jugador_arr:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_arriba
		;; DL <- elemento en mapa
		cmp DL, CAJA ;si se encuentra caja reposicionar elemento caja
		je mover_caja_arr
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		inc AL
		call colocar_en_mapa
		call contador_movimiento
		ret
hay_pared_arriba:
		ret
mover_jugador_aba:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_abajo
		;; DL <- elemento en mapa
		cmp DL, CAJA ;si se encuentra caja reposicionar elemento caja
		je mover_caja_aba
		continuar_jug_abajo:
		mov [yJugador], AL
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		dec AL
		call colocar_en_mapa
		call contador_movimiento
		ret
hay_pared_abajo:
		ret
mover_jugador_izq:
		mov AH, [xJugador]
		mov AL, [yJugador]
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_izquierda
		;; DL <- elemento en mapa
		cmp DL, CAJA ;si se encuentra caja reposicionar elemento caja
		je mover_caja_izq
		continuar_jug_izq:
		mov [xJugador], AH
		;;
		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		inc AH
		call colocar_en_mapa
		call contador_movimiento
		ret
hay_pared_izquierda:
		ret
mover_jugador_der:
		mov AH, [xJugador]
		mov AL, [yJugador]
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
		;; DL <- elemento en mapa
		cmp DL, PARED
		je hay_pared_derecha
		; ;; DL <- elemento en mapa
		cmp DL, CAJA ;si se encuentra caja reposicionar elemento caja
		je mover_caja_der
		continuar_jug_der:
		mov [xJugador], AH
		;;

		mov DL, JUGADOR
		push AX
		call colocar_en_mapa
		pop AX
		;;
		mov DL, SUELO
		dec AH
		call colocar_en_mapa
		call contador_movimiento
		ret
hay_pared_derecha:
		ret
fin_entrada_juego:
		ret

mover_caja_arr:
	mov AH, [xJugador]
	mov AL, [yJugador]
	dec AL
	dec AL
	push AX
	call obtener_de_mapa
	pop AX
	cmp DL, PARED
	je hay_pared_arriba_caja
	;;
	cmp DL, CAJA
	je hay_pared_arriba_caja
	;;
	mov DL, CAJA
	push AX
	call colocar_en_mapa
	pop AX
	;;
	mov DL, SUELO
	inc AL
	call colocar_en_mapa
; 	mov DL, CAJA
; 	mov AH, 2
; 	mov AL, 3
; 	call colocar_en_mapa
	jmp mover_jugador_arr
hay_pared_arriba_caja:
ret

mover_caja_aba:
	mov AH, [xJugador]
	mov AL, [yJugador]
	inc AL
	inc AL
	push AX
	call obtener_de_mapa
	pop AX
	cmp DL, PARED
	je hay_pared_abajo_caja
	;;
	cmp DL, CAJA
	je hay_pared_abajo
	;;
	mov DL, CAJA
	push AX
	call colocar_en_mapa
	pop AX
	;;
; 	mov DL, CAJA
; 	mov AH, 2
; 	mov AL, 3
; 	call colocar_en_mapa
	dec AL
	jmp continuar_jug_abajo
hay_pared_abajo_caja:
ret

mover_caja_izq:
	mov AH, [xJugador]
	mov AL, [yJugador]
	dec AH
	dec AH
	push AX
	call obtener_de_mapa
	pop AX
	cmp DL, PARED
	je hay_pared_izq_caja
	;;
	cmp DL, CAJA
	je hay_pared_izquierda
	;;
	mov DL, CAJA
	push AX
	call colocar_en_mapa
	pop AX
	;;
; 	mov DL, CAJA
; 	mov AH, 2
; 	mov AL, 3
; 	call colocar_en_mapa
	inc AH
	jmp continuar_jug_izq
hay_pared_izq_caja:
ret

mover_caja_der:
	mov AH, [xJugador]
	mov AL, [yJugador]
	inc AH
	inc AH
	push AX
	call obtener_de_mapa
	pop AX
	cmp DL, PARED
	je hay_pared_der_caja
	;;
	cmp DL, CAJA
	je hay_pared_derecha
	;;
	mov DL, CAJA
	push AX
	call colocar_en_mapa
	pop AX
	;;
; 	mov DL, CAJA
; 	mov AH, 2
; 	mov AL, 3
; 	call colocar_en_mapa
	dec AH
	jmp continuar_jug_der
hay_pared_der_caja:
ret


;; siguiente_linea - extrae la siguiente línea del archivo referenciado por el handle en BX
;; ENTRADA:
;;    - BX: handle
;; SALIDA:
;;    - [linea]: contenido de la línea que se extrajo, finalizada en 00 (nul0)
;;    - DL: si el archivo llegó a su fin
;;    - DH: la cantidad de caracteres en la línea
siguiente_linea:
		mov SI, 0000
		mov DI, offset linea
		;;
ciclo_sig_linea:
		mov AH, 3f
		mov CX, 0001
		mov DX, DI
		int 21
		cmp AX, 0000
		je fin_siguiente_linea
		mov AL, [DI]
		cmp AL, 0a
		je quitar_nl_y_fin
		inc SI
		inc DI
		jmp ciclo_sig_linea
quitar_nl_y_fin:
		mov AL, 00
		mov [DI], AL
		mov DX, SI
		mov DH, DL
		mov DL, 00    ;; no ha finalizado el archivo
		ret
fin_siguiente_linea:
		mov DL, 0ff   ;; ya finalizó el archivo
		ret


;; cadena_igual - verifica que dos cadenas sean iguales
;; ENTRADA:
;;    - SI: cadena 1, con su tamaño en el primer byte
;;    - DI: cadena 2
;; SALIDA:
;;    - DL: 0ff si son iguales, 00 si no lo son
cadena_igual:
		mov CH, 00
		mov CL, [SI]
		inc SI
ciclo_cadena_igual:
		mov AL, [SI]
		cmp AL, [DI]
		jne fin_cadena_igual
		inc SI
		inc DI
		loop ciclo_cadena_igual
cadenas_son_iguales:
		mov DL, 0ff
		ret
fin_cadena_igual:
		mov DL, 00
		ret


;; ignorar_espacios - ignora una sucesión de espacios
;; ENTRADA:
;;    - DI: offset de una cadena cuyo primer byte se supone es un espacio
;; ...
ignorar_espacios:
ciclo_ignorar:
		mov AL, [DI]
		cmp AL, 20
		jne fin_ignorar
		inc DI
		jmp ciclo_ignorar
fin_ignorar:
		ret


;; memset - memset
;; ENTRADA:
;;    - DI: offset del inicio de la cadena de bytes
;;    - CX: cantidad de bytes
;;    - AL: valor que se pondrá en cada byte
memset:
		push DI
ciclo_memset:
		mov [DI], AL
		inc DI
		loop ciclo_memset
		pop DI
		ret


;; leer_cadena_numerica - lee una cadena que debería estar compuesta solo de números
;; ENTRADA:
;;    - DI: offset del inicio de la cadena numérica
;; SALIDA:
;;    - [numero]: el contenido de la cadena numérica
leer_cadena_numerica:
		mov SI, DI
		;;
		mov DI, offset numero
		mov CX, 0005
		mov AL, 30
		call memset
		;;
		mov DI, SI
		mov CX, 0000
ciclo_ubicar_ultimo:
		mov AL, [DI]
		cmp AL, 30
		jb copiar_cadena_numerica
		cmp AL, 39
		ja copiar_cadena_numerica
		inc DI
		inc CX
		jmp ciclo_ubicar_ultimo
copiar_cadena_numerica:
		push DI   ;;   <----
		dec DI
		;;
		mov SI, offset numero
		add SI, 0004
ciclo_copiar_num:
		mov AL, [DI]
		mov [SI], AL
		dec DI
		dec SI
		loop ciclo_copiar_num
		pop DI
		ret

;; cadenaAnum
;; ENTRADA:
;;    DI -> dirección a una cadena numérica
;; SALIDA:
;;    AX -> número convertido
;;;;
cadenaAnum:
		mov AX, 0000    ; inicializar la salida
		mov CX, 0005    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DX, 000a
		mul DX          ; AX * DX -> DX:AX
		mov BH, 00
		add AX, BX
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret

;solo los segundos para llevar tiempo de juego
get_current_time:
	push AX
	push CX
	mov AH, 2C
	int 21
	mov [hora], CH
	mov [minuto], CL
	mov [segundo], DH
	pop CX
	pop AX
	ret

get_cadena_hora:
    ;obtenemos la hora
    mov AX, 0000
    mov AL, [hora]
    call numero_a_cadena
    ret

get_cadena_minuto:
    ;obtenemos el minuto
    mov AX, 0000
    mov AL, [minuto]
    call numero_a_cadena
    ret

get_cadena_segundos:
    ;obtenemos la fecha y la hora
    mov AX, 0000
    mov AL, [segundo]
    call numero_a_cadena
    ret

numero_a_cadena PROC
	push CX
	push DI
	push BX
    mov CX, 0002
	mov DI, offset numero_ascii
    ciclo_poner30s:
		mov BL, 30
		mov [DI], BL
		inc DI
		loop ciclo_poner30s
		;; tenemos '0' en toda la cadena
		mov CX, AX    ; inicializar contador
		mov DI, offset numero_ascii
		add DI, 0001
		;;
    ciclo_convertirAcadena:
            mov BL, [DI]
            inc BL
            mov [DI], BL
            cmp BL, 3a
            je aumentar_siguiente_digito_primera_vez
            loop ciclo_convertirAcadena
			pop BX
			pop DI
			pop CX
            ret
    aumentar_siguiente_digito_primera_vez:
            push DI
    aumentar_siguiente_digito:
            mov BL, 30     ; poner en '0' el actual
            mov [DI], BL
            dec DI         ; puntero a la cadena
            mov BL, [DI]
            inc BL
            mov [DI], BL
            cmp BL, 3a
            je aumentar_siguiente_digito
            pop DI         ; se recupera DI
            loop ciclo_convertirAcadena
    pop BX
	pop DI
	pop CX
	ret
numero_a_cadena ENDP

pie_de_juego:
	push AX
	push DX
	push BX
	;encabezado con de juego
	call get_cadena_punteo
	mov DL, 22
	mov DH, 00
	mov BH, 00
	mov AH, 02
	int 10
	mov DX, offset numero_ascii_lenght5
	mov AH, 09
	int 21
	;pie de pagina en el ciclo del juego
	mov DL, 00
	mov DH, 18
	mov BH, 00
	mov AH, 02
	int 10
	mov DX, offset iniciales_pie
	mov AH, 09
	int 21
	;contador del tiempo de juego transcurrido
	call contador_tiempo_juego

	;llamar etiqueta de suma de tiempo de juego
	;imprimir el tiempo de las horas
	;obtener get cadena hora si es mayor que 00
	mov CL, [t_hora_jueg_jug]
	cmp CL, 00
	ja llamar_cadena_hora
	jmp no_llamar_cadena_hora
llamar_cadena_hora:
	call get_cadena_hora_juego
	jmp continuar_hora
no_llamar_cadena_hora:
	call poner_cero_numero_ascii
continuar_hora:
	mov DL, 1F
	mov DH, 18
	mov BH, 00
	mov AH, 02
	int 10
	mov DX, offset numero_ascii
	mov AH, 09
	int 21
	;imprimir dos puntos
	mov DL, 21
	mov DH, 18
	mov BH, 00
	mov AH, 02
	int 10
	mov DX, offset dos_puntos
	mov AH, 09
	int 21
	;imprimir el tiempo de los minutos
	mov CL, [t_min_jueg_jug]
	cmp CL, 00
	ja llamar_cadena_minuto
	jmp no_llamar_cadena_minuto
llamar_cadena_minuto:
	call get_cadena_minuto_juego
	jmp continuar_minutos
no_llamar_cadena_minuto:
	call poner_cero_numero_ascii
continuar_minutos:
	mov DL, 22
	mov DH, 18
	mov BH, 00
	mov AH, 02
	int 10
	mov DX, offset numero_ascii
	mov AH, 09
	int 21
	;imprimir dos puntos
	mov DL, 24
	mov DH, 18
	mov BH, 00
	mov AH, 02
	int 10
	mov DX, offset dos_puntos
	mov AH, 09
	int 21
	;actualizacion del tiempo solo para segundos transcurridos
	call get_current_time
	;pie de pagina en el ciclo del juego tiempo de juego
	call get_cadena_segundos
	mov DL, 25
	mov DH, 18
	mov BH, 00
	mov AH, 02
	int 10
	mov DX, offset numero_ascii
	mov AH, 09
	int 21
	pop BX
	pop DX
	pop AX
	ret

poner_cero_numero_ascii:
	push SI
	push BX
	mov SI, offset numero_ascii
	mov BL, 30 ; 0 en ascci
	mov [SI], BL
	mov [SI+1], BL
	pop BX
	pop SI
	ret

contador_tiempo_juego:
	push BX
	push AX
	mov AX, 0000
	mov BL, [segundo]
	cmp BL, 3B
	je aumentar_minuto
	jmp fin_contador_tiempo
aumentar_minuto:
	mov AL, [t_min_jueg_jug]
	inc AX
	mov [t_min_jueg_jug], AL

	jmp fin_contador_tiempo

fin_contador_tiempo:
	pop AX
	pop BX
	ret

get_cadena_hora_juego:
    ;obtenemos la hora
    mov AX, 0000
    mov AL, [t_hora_jueg_jug]
    call numero_a_cadena
    ret

get_cadena_minuto_juego:
    ;obtenemos el minuto
    mov AX, 0000
    mov AL, [t_min_jueg_jug]
    call numero_a_cadena
    ret

get_cadena_punteo:
	push AX
	mov AX, 0000
    mov AX, [puntos]
	call numero_a_cadena_5
	pop AX
	ret

numero_a_cadena_5 PROC
	push CX
	push DI
	push BX

    mov CX, 0005
	mov DI, offset numero_ascii_lenght5
    ciclo_poner30ss:
		mov BL, 30
		mov [DI], BL
		inc DI
		loop ciclo_poner30ss
		;; tenemos '0' en toda la cadena
		mov CX, AX    ; inicializar contador
		mov DI, offset numero_ascii_lenght5
		add DI, 0004
		;;
    ciclo_convertirAcadena5:
            mov BL, [DI]
            inc BL
            mov [DI], BL
            cmp BL, 3a
            je aumentar_siguiente_digito_primera_vez5
            loop ciclo_convertirAcadena5
			pop BX
			pop DI
			pop CX
            ret
    aumentar_siguiente_digito_primera_vez5:
            push DI
    aumentar_siguiente_digito5:
            mov BL, 30     ; poner en '0' el actual
            mov [DI], BL
            dec DI         ; puntero a la cadena
            mov BL, [DI]
            inc BL
            mov [DI], BL
            cmp BL, 3a
            je aumentar_siguiente_digito5
            pop DI         ; se recupera DI
            loop ciclo_convertirAcadena5
    pop BX
	pop DI
	pop CX
	ret
numero_a_cadena_5 ENDP

obtener_nombre_archivo_nivel:
	push AX
	push BX
	push DX
	;pintar pedir nivel
	mov DL, 04
	mov DH, 0C
	mov BH, 00
	mov AH, 02
	int 10
	mov DX, offset msg_pedir_nivel
	mov AH, 09
	int 21

	;entrada en teclado!
    mov DX, offset buffer_teclado
    mov AH, 0A
    int 21

	call copiar_a_memoria_nivel_x

	pop DX
	pop BX
	pop AX
	ret

copiar_a_memoria_nivel_x:
	push SI
	push DI
	push AX
	push CX
	mov DI, offset nivel_x
	mov SI, offset buffer_teclado
	inc SI
	mov CH, 00
	mov CL, [SI] ;se obtiene la cantidad de  letra a copiar
	inc SI
	ciclo_copiar_nivelx:
		mov AL, [SI]
		mov [DI], AL
	loop ciclo_copiar_nivelx
	pop CX
	pop AX
	pop DI
	pop SI
	ret

contador_movimiento:
	push AX
	mov AX, 0000
	mov AX, [puntos]
	inc AX
	mov [puntos], AX
	pop AX
	ret

fin:
.EXIT
END