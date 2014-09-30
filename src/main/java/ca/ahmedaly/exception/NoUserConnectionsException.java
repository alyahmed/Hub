/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.ahmedaly.exception;

/**
 * Represents use case where a user is trying to access content without registering any social accounts.
 * @author ahmed
 */
public class NoUserConnectionsException extends RuntimeException {

    /**
     * Creates a new instance of <code>NoUserConnectionsException</code> without
     * detail message.
     */
    public NoUserConnectionsException() {
    }

    /**
     * Constructs an instance of <code>NoUserConnectionsException</code> with
     * the specified detail message.
     *
     * @param msg the detail message.
     */
    public NoUserConnectionsException(String msg) {
        super(msg);
    }
}
