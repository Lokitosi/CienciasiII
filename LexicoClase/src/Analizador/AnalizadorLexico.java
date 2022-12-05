/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author mdelgado
 */
public class AnalizadorLexico {
    
    private static String rutaBase = "src/properties";
    
    public static void main(String[] args) throws Exception {
        String camino=  String.format("%s/Lexico.flex", rutaBase);
        String camino1= String.format("%s/LexicoCup.flex", rutaBase);
        String[] caminoS= {"-parser","Sintaxis",String.format("%s/Sintaxis.cup", rutaBase)};
        generarLex(camino, camino1, caminoS);
        
    }
    public static void generarLex(String camino, String camino1, String[] caminoS) throws IOException, Exception {
        File arc; 
        arc = new File(camino);
        JFlex.Main.generate(arc);
        arc = new File(camino1);
        JFlex.Main.generate(arc);
        java_cup.Main.main(caminoS);     
        
        Path caminoSym = Paths.get("src/properties/sym.java");
        if (Files.exists(caminoSym)) {
            Files.delete(caminoSym);
        }
        Files.move(
                Paths.get("sym.java"), 
                Paths.get("src/properties/sym.java")
        );
        Path caminoSint = Paths.get("/src/properties/Sintaxis.java");
        if (Files.exists(caminoSint)) {
            Files.delete(caminoSint);
        }
        Files.move(
                Paths.get("Sintaxis.java"), 
                Paths.get("src/properties/Sintaxis.java")
        );        
    }
}
