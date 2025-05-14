/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import jflex.Main;

/**
 *
 * @author SCJ
 */
public class Principal {
    public static void main(String[] args) {
        String[] flexArchivo1 = {"C:/Users/Emanuel/Documents/NetBeansProjects/Analizador/src/codigo/Lexer.flex"};
        String[] flexArchivo2 = {"C:/Users/Emanuel/Documents/NetBeansProjects/Analizador/src/codigo/LexerCup.flex"};
        String[] rutaS = {"-parser", "Sintax", "C:/Users/Emanuel/Documents/NetBeansProjects/Analizador/src/codigo/Sintax.cup"};
        
        
        try {
            Main.main(flexArchivo1);
            System.out.println("Lexer.java generado correctamente.");
            Main.main(flexArchivo2);
            System.out.println("LexerCup.java generado correctamente.");
            java_cup.Main.main(rutaS);
            
            
            
            Files.move(
                    Paths.get("C:/Users/Emanuel/Documents/NetBeansProjects/Analizador/sym.java"),
                    Paths.get("C:/Users/Emanuel/Documents/NetBeansProjects/Analizador/src/codigo/sym.java"),
                    StandardCopyOption.REPLACE_EXISTING
            );
            
            Files.move(
                    Paths.get("C:/Users/Emanuel/Documents/NetBeansProjects/Analizador/Sintax.java"),
                    Paths.get("C:/Users/Emanuel/Documents/NetBeansProjects/Analizador/src/codigo/Sintax.java"),
                    StandardCopyOption.REPLACE_EXISTING
            );
            
            System.out.println("sym.java y Sintax.java generados correctamente.");
        } catch (Exception e) {
            System.err.println("Error al generar Lexer.java: " + e.getMessage());
        }
   
    }
}
