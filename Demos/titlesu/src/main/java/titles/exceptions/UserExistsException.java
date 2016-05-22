/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package titles.exceptions;


public class UserExistsException extends Exception{

    @Override
    public String getMessage() {
        return "this email already exists";
    }
    
    
}
