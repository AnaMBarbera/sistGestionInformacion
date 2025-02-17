/*Ejercicio 1: Marcador de tenis simplificado

    Diseña un programa que permita llevar el marcador de un partido de tenis:
        Solicita los nombres de los jugadores.
        Permite ingresar quién gana cada punto y actualiza el marcador.
        Llega a "deuce" cuando ambos tienen 40 puntos.
        Lleva el conteo de juegos ganados, y cuando un jugador llega a 6 juegos, suma un set.
        Finaliza cuando un jugador gana 2 sets.*/

        const prompt = require("prompt-sync")();

        let jugador1 = prompt("Nombre del primer jugador: ");
        let jugador2 = prompt("Nombre del segundo jugador: ");

        //El primer punto da 15 puntos al ganador, el segundo 30 y el tercero 40
        let puntos1 = 0; //puntos del jugador 1
        let puntos2 = 0; //puntos del jugador 2
        let juegos1 = 0; //juegos del jugador 1
        let juegos2 = 0; //juegos del jugador 2
        let sets1 = 0;  // sets del jugador 1
        let sets2 = 0;  // sets del jugador 2

        let finpartido = false;

        do {
            let ganador = prompt("¿Qué jugador gana el punto (1 ó 2): ")
            if(ganador==1){
                puntos1++                
            } else {
                puntos2++
                }

            //Verificar si hay deuce
            if (puntos1==3 && puntos2==3){
                console.log("¡DEUCE!")
            } 

            //Mostrar puntos
                if (puntos1 == 0){                
                        console.log(`${jugador1} tiene 0 puntos`);
                    } else if (puntos1==1){
                            console.log(`${jugador1} tiene 15 puntos`);
                        } else if (puntos1==2){
                            console.log(`${jugador1} tiene 30 puntos`);
                            } else if (puntos1==3){
                                console.log(`${jugador1} tiene 40 puntos`);
                            } 

                //usando operador terniario para el jugador 2
                console.log(`${jugador2} tiene ${puntos2 == 0 ? 0 : (puntos2 == 1 ? 15 : (puntos2 == 2 ? 30 : (puntos2 == 3 ? 40 : '')))} puntos`);

            // Verificación de ganadores de juegos
            if (puntos1>=4 && (puntos1-puntos2)>=2){
                console.log(`El ganador del juego es ${jugador1}`)
                juegos1++;
                puntos1 = 0;  // Reiniciar puntos después de ganar un juego
                puntos2 = 0;
            }
            if (puntos2>=4 && (puntos2-puntos1)>=2){
                console.log(`El ganador del juego es ${jugador2}`)
                juegos2++;
                puntos1 = 0;  // Reiniciar puntos después de ganar un juego
                puntos2 = 0;
            }

            // Verificación de sets ganados
            if(juegos1 >=6 && juegos1>juegos2){
                console.log(`${jugador1} ha ganado un set`)
                juegos1 = 0;  // Reiniciar juegos después de ganar un set
                juegos2 = 0;
                sets1++;
            }
            if(juegos2 >=6 && juegos2>juegos1){
                console.log(`${jugador2} ha ganado un set`)
                juegos1 = 0;  // Reiniciar juegos después de ganar un set
                juegos2 = 0;
                sets2++;
            }

            if (sets1 == 2) {
                console.log(`${jugador1} ha ganado 2 sets y el partido`);
                finpartido = true;
            }        
            if (sets2 == 2) {
                console.log(`${jugador2} ha ganado 2 sets y el partido`);
                finpartido = true;
            }
        
        } while (finpartido == false);

        

