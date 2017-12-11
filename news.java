/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmiu.scse.mypractice.news;

import java.util.ArrayList;

/**
 *
 * @author user
 */
public class news {
    int idnews ;
    String titile;
    String content;
    String author;
    String date;
    String im;
 

    public news() {
        this.idnews = -1;
        this.titile="";
        this.content="";
        this.author="";
        this.date = "";
        this.im = "";
    }

    public news(int idnews, String titile, String content, String date , String author , String im) {
        this.idnews = idnews;
        this.titile = titile;
        this.content = content;
        
        this.date = date;
        this.author = author;
        this.im =im ;
    }

    public String getIm() {
        return im;
    }

    
    

    public int getIdnews() {
        return idnews;
    }

    public String getTitile() {
        return titile;
    }

    public String getContent() {
        return content;
    }

    public String getAuthor() {
        return author;
    }

    public String getDate() {
        return date;
    }

    
}
