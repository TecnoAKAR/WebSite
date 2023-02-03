
package org.akar.extConnections;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class Servidor{
    private ServerSocket sS;
    private Socket s;
    private ObjectInputStream ois;
    private ObjectOutputStream oos;
    private Boolean connected; 
    private String status;
    
    public Servidor(){
        connected = false;
    }
    
    public void iniSocket(int puerto){
        try {
            sS = new ServerSocket(puerto);
            s = sS.accept();
        } catch (Exception e) {
        }
    }
    
    public void flujos(){
        try {
            oos = new ObjectOutputStream(s.getOutputStream());
            ois = new ObjectInputStream(s.getInputStream());
            oos.flush();
        } catch (Exception e) {
        }
    }
    
    public void cerrar(){
        try {
            ois.close();
            oos.close();
            s.close();
            sS.close();
        } catch (Exception e) {
        }
    }
    
    public void enviar(String msj){
        try {            
            oos.writeObject(msj);
            oos.flush();
        } catch (Exception e) {
        }
    }
    
    public void recibir(){
        try {
            boolean c = true;
            while(c == true){
                status = (String) ois.readObject();
            }
        } catch (Exception e) {
        }
    }
    
    public void conexion(String puertoS) {
        Thread hilo = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    int puerto = Integer.parseInt(puertoS);
                    iniSocket(puerto);
                    flujos();
                    connected = true;
                    recibir();
                }catch (Exception ex) {
                }
            }
        });
        hilo.start();
    }
    
    public Boolean isConnected(){
        return connected;
    }
    
    public String status(){
        return status;
    }
    
    public String connectedWith(){
        return s.getInetAddress().toString();
    }
}
