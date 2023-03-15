/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Recipe {

    private int recipeId;
    private boolean isOfficial;
    private String name;
    private String instructions;
    private String tags;
    private String servings;
    private String image;
    private String ingredients;

    public Recipe(int recipeId, boolean isOfficial, String name, String instructions, String tags, String servings, String image, String ingredients) {
        this.recipeId = recipeId;
        this.isOfficial = isOfficial;
        this.name = name;
        this.instructions = instructions;
        this.tags = tags;
        this.servings = servings;
        this.image = image;
        this.ingredients = ingredients;
    }

    

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }
    
    
    public Recipe() {
    }

    

    public Recipe(int recipeId, boolean isOfficial, String name, String instructions, String servings, String image) {
        this.recipeId = recipeId;
        this.isOfficial = isOfficial;
        this.name = name;
        this.instructions = instructions;
        this.servings = servings;
        this.image = image;
    }
    
    public int getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public boolean isIsOfficial() {
        return isOfficial;
    }

    public void setIsOfficial(boolean isOfficial) {
        this.isOfficial = isOfficial;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    

    public String getServings() {
        return servings;
    }

    public void setServings(String servings) {
        this.servings = servings;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
    