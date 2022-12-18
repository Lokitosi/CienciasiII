package util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;
import java.util.Scanner;
import javax.swing.JOptionPane;

public class Util {

    private static final String basePath = "src/scripts/";
    private static final String path = "src/outputs/";
    public static String result = "";

    public static void clearCacheData() {
        String[] files = {"Program.cpp", "Program.i", "Program.o", "Program.s", "Program.exe", "Program", "Program.out","Output.txt"};
        try {
            for (String file : files) {
                Path direction = Paths.get(path.concat(file));
                if (Files.exists(direction)) {
                    Files.delete(direction);
                }
            }
        } catch (IOException ex) {
            ex.printStackTrace(System.err);
        }
    }

    public static void createFile(String contentFile) {
        File file = new File(path.concat("Program.cpp"));
        try {
            FileWriter fw;
            fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(contentFile);
            bw.close();
        } catch (IOException ex) {
            ex.printStackTrace(System.err);
        }
    }

    public static String getExtension(String name) {
        return ((Objects.equals(System.getProperty("os.name"), "Linux")) ? ".sh" : ".bat");
    }

    public static int executeFile(String fileName) {
        int response = 0;
        result = "";
        try {
            fileName = fileName.concat(getExtension(fileName));
            String[] command = {
                basePath.concat((fileName))
            };
            System.out.println("Ejecutando:" + fileName + "\n");
            Process process = Runtime.getRuntime().exec(command);

            BufferedReader stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));
            BufferedReader stdError = new BufferedReader(new InputStreamReader(process.getErrorStream()));

            String standarOut = null;
            String standarError = null;

            System.out.println("Salida:");
            while ((standarOut = stdInput.readLine()) != null) {
                System.out.println(standarOut);
                result += standarOut;
            }

            System.out.println("\n");
            System.out.println("Errores: \n");
            while ((standarError = stdError.readLine()) != null) {
                System.out.println(standarError);
                response = -1;
            }
            process.destroy();
            JOptionPane.showMessageDialog(null, String.format("Ejecución de %s finalizada", fileName), "Salida", JOptionPane.DEFAULT_OPTION);

        } catch (IOException e) {
            e.printStackTrace(System.err);
            JOptionPane.showMessageDialog(null, String.format("Error en la Ejecución de %s", fileName), "Error", JOptionPane.ERROR);
            response = -1;
        }
        return response;
    }

    public static void readOutput() {
        try {
            String output = "";
            File myObj = new File("src/dist/output.txt");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                output += data;
            }
            result = output;
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("No se pudo leer el contenido del output generado");
            e.printStackTrace();
        }
    }

}
