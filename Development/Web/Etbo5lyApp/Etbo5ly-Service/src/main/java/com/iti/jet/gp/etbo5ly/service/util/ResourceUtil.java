/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.util;

/**
 *
 * @author AlJazayeerly
 */
public class ResourceUtil {

    private static String PROTOCOL ="http://";
    private static String HOST_IP = "10.118.49.27"; //"127.0.0.1";//
    private static String PORT = "8084";
    private static String APPLICATION_CONTEXT= "/Etbo5ly-Web";
    private static String RESOURCE_URL ="/resources/images/";
    
    public static String getMealsImagesURL(){
        return PROTOCOL+HOST_IP+":"+PORT+APPLICATION_CONTEXT+RESOURCE_URL+"meals/";
    }
    
    public static String getCooksImagesURL(){
        return PROTOCOL+HOST_IP+":"+PORT+APPLICATION_CONTEXT+RESOURCE_URL+"cooks/";
    }

}
