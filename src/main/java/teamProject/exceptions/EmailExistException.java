/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.exceptions;

/**
 *
 * @author tzortziskapellas
 */
public class EmailExistException extends Exception{

    public EmailExistException(String string) {
        super(string);
    }
    
}
