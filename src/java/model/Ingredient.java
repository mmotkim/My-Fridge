/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author mmotk
 */
public class Ingredient {
    private int ingId;
    private String ingName;

    public Ingredient() {
    }

    public Ingredient(int ingId, String ingName) {
        this.ingId = ingId;
        this.ingName = ingName;
    }

    public int getIngId() {
        return ingId;
    }

    public void setIngId(int ingId) {
        this.ingId = ingId;
    }

    public String getIngName() {
        return ingName;
    }

    public void setIngName(String ingName) {
        this.ingName = ingName;
    }
    
    
}
