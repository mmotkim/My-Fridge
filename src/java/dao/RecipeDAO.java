/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.StringTokenizer;
import model.Recipe;

/**
 *
 * @author mmotk
 */
public class RecipeDAO extends DBContext {

    public RecipeDAO() {
    }

    public ArrayList<Recipe> getAllRecipes() {
        return null;
    }

    public ArrayList<Recipe> getRecipesFromIngredients(String ingredientList) {
        //egg, tomato
        ArrayList<Recipe> list = new ArrayList<>();

        //'egg','tomato'
        StringTokenizer s = new StringTokenizer(ingredientList, ",");
        ArrayList<String> r = new ArrayList<>();
        while (s.hasMoreTokens()) {
            r.add("'" + s.nextToken() + "'");
        }
        String sql = "SELECT DISTINCT  r.recipeId,r.isOfficial,r.name,r.instructions, r.servings, r.image "
                + "from ([Recipe] r INNER JOIN "
                + "[RecipeIngredients] ri on r.recipeId = ri.recipeId) "
                + "INNER JOIN [Ingredients] i on ri.ingId = i.ingId "
                + "where i.ingName in (" + String.join(",", r) + ")";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Recipe(rs.getInt(1), rs.getBoolean(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public void editRecipe(int recipeId, String name, String instructions, String servings, String image, String ingredients) {
        String sql = "UPDATE [Recipe] set [name]=? , [instructions]=? , [servings] = ? , [image] = ? where recipeId = " + recipeId;
        String delsql = "DELETE FROM [RecipeIngredients] where [recipeId] = " + recipeId;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, instructions);
            ps.setString(3, servings);
            ps.setString(4, image);
            ResultSet rs = ps.executeQuery();
        } catch (Exception e) {

        }
        
        StringTokenizer s = new StringTokenizer(ingredients, ",");
        ArrayList<String> r = new ArrayList<>();
        while (s.hasMoreTokens()) {
            r.add("'" + s.nextToken() + "'");
        }
        try{
            String sql2 = "INSERT INTO [RecipeIngredients] (recipeId, IngId"
                + "VALUES (" + recipeId + ",?)";
            PreparedStatement ps = connection.prepareStatement(sql2);
            
            for (String ingr : r) {
                ps.setString(1, ingr);
                
                ps.executeUpdate();
            }
        }catch (Exception e){}
        
        
    }

    public int getNewRecipeId() {
        String sql = "SELECT TOP(1) recipeId from [Recipe] "
                + "order by recipeId DESC";
        int id = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            id = rs.getInt(1);
        } catch (Exception e) {
            
        }

        return id + 1;
    }

    public void addRecipe(String name, String instructions, String tags, String servings, String image, String ingredients) {
        int id = getNewRecipeId();
        String sql = "INSERT INTO [Recipe] (recipeId, isOfficial, name, instructions, tags, servings, image)"
                + "VALUES (" + id + ", 0, ?, ?, ?, ?, ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, instructions);
            ps.setString(3, tags);
            ps.setString(4, servings);
            ps.setString(5, image);
            
            ps.executeUpdate();
            
        } catch (Exception e){}
        
        
        
        StringTokenizer s = new StringTokenizer(ingredients, ",");
        ArrayList<String> r = new ArrayList<>();
        while (s.hasMoreTokens()) {
            r.add("'" + s.nextToken() + "'");
        }
        try{
            String sql2 = "INSERT INTO [RecipeIngredients] (recipeId, IngId"
                + "VALUES (" + id + ",?)";
            PreparedStatement ps = connection.prepareStatement(sql2);
            
            for (String ingr : r) {
                ps.setString(1, ingr);
                
                ps.executeUpdate();
            }
        }catch (Exception e){}
        

    }

    public static void main(String[] args) {
        RecipeDAO rdao = new RecipeDAO();

        System.out.println(rdao.getNewRecipeId());
        
    }

}
