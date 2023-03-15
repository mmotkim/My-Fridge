/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.StringTokenizer;
import model.Ingredient;
import model.Recipe;

/**
 *
 * @author mmotk
 */
public class RecipeDAO extends DBContext {

    public RecipeDAO() {
    }

    public ArrayList<Recipe> getAllRecipes() {
        String sql = "SELECT DISTINCT * "
                + "from ([Recipe] r INNER JOIN "
                + "[RecipeIngredients] ri on r.recipeId = ri.recipeId) "
                + "INNER JOIN [Ingredients] i on ri.ingId = i.ingId ";

        return null;
    }
    
    public void deleteByID(int id){
        String sql1 = "DELETE FROM [SavedRecipes] where recipeId = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setInt(1, id);
            ps.executeUpdate();
        }catch (Exception e) {
        }
        String sql2 = "DELETE FROM [RecipeIngredients] where recipeId = ?";
        try{
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, id);
            ps2.executeUpdate();
        }catch (Exception e) {
        }
        String sql3 = "DELETE FROM [Recipe] WHERE recipeId = ?";
        try{
            PreparedStatement ps3 = connection.prepareStatement(sql3);
            ps3.setInt(1, id);
            ps3.executeUpdate();
        }catch (Exception e) {
        }
        
        
    }

    public Recipe getRecipeByID(int id) {
        String sql = "SELECT * FROM [Recipe] WHERE recipeId = ?";
        Recipe r = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            RecipeDAO rdao = new RecipeDAO();
            ArrayList<String> ingrs = rdao.getIngredientsFromRecipeID(id);

            while (rs.next()) {
                r = new Recipe(rs.getInt(1), rs.getBoolean(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), String.join(",", ingrs));
            }
        } catch (Exception e) {
        }
        return r;
    }

    public ArrayList<Recipe> getRecipesFromUserID(int id) {
        String sql = "SELECT * FROM [savedRecipes] WHERE userId = ?";
        
        ArrayList<Recipe> rlist = new ArrayList<>();
        RecipeDAO rdao = new RecipeDAO();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                rlist.add(rdao.getRecipeByID(rs.getInt(2)));
            }

        } catch (Exception e) {
        }
        return rlist;
    }

    public ArrayList<String> getIngredientsFromRecipeID(int id) {
        String sql = "SELECT ingName from [RecipeIngredients] ri INNER JOIN [Ingredients] i on ri.ingId = i.ingId where recipeId = " + id;
        ArrayList<String> ingrs = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ingrs.add(rs.getString(1));
            }
        } catch (Exception e) {
        }

        return ingrs;
    }

    public ArrayList<Recipe> getRecipesFromIngredients(String ingredientList) {
        //egg, tomato
        ArrayList<Recipe> list = new ArrayList<>();

        //'egg','tomato'
        StringTokenizer s = new StringTokenizer(ingredientList, ",");
        ArrayList<String> r = new ArrayList<>();
        RecipeDAO rdao = new RecipeDAO();
        while (s.hasMoreTokens()) {
            r.add("'" + s.nextToken() + "'");
        }
        String sql = "SELECT DISTINCT ri.recipeId, r.isOfficial, r.name, r.instructions, r.tags, r.servings, r.image "
                + "from ([Recipe] r INNER JOIN "
                + "[RecipeIngredients] ri on r.recipeId = ri.recipeId) "
                + "INNER JOIN [Ingredients] i on ri.ingId = i.ingId "
                + "where i.ingName in (" + String.join(",", r) + ")";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ArrayList<String> ingrs = getIngredientsFromRecipeID(rs.getInt(1));
                list.add(new Recipe(rs.getInt(1), rs.getBoolean(2), rs.getString(3), rs.getString(4),rs.getString(5) ,rs.getString(6), rs.getString(7), String.join(",", ingrs)));
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
        try {
            String sql2 = "INSERT INTO [RecipeIngredients] (recipeId, IngId"
                    + "VALUES (" + recipeId + ",?)";
            PreparedStatement ps = connection.prepareStatement(sql2);

            for (String ingr : r) {
                ps.setString(1, ingr);

                ps.executeUpdate();
            }
        } catch (Exception e) {
        }

    }

    public int getNewRecipeId() {
        String sql = "SELECT TOP(1) recipeId from [Recipe] "
                + "order by recipeId DESC";
        int id = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id += rs.getInt(1);
            }
        } catch (Exception e) {

        }

        return id + 1;
    }

    public void addRecipe(int userId, String name, String instructions, String tags, String servings, String image, String ingredients) {
        //check if admin to set isOfficial
        UserDAO udao = new UserDAO();
        int role = 0; //default normal user
        if (udao.getUserById(userId).getRoleId() == 1) {
            role = 1;
        }

        int id = getNewRecipeId();
        System.out.println(id);
        String sql = "INSERT INTO [Recipe] (recipeId, isOfficial, name, "
                + "instructions, tags, servings, image)"
                + "VALUES (" + id + ", ?, ?, ?, ?, ?, ?)";
        RecipeDAO rdao = new RecipeDAO();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, role);
            ps.setString(2, name);
            ps.setString(3, instructions);
            ps.setString(4, tags);
            ps.setString(5, servings);
            ps.setString(6, image);
            System.out.println(ps.toString());

            ps.executeUpdate();
            System.out.println("complete");

        } catch (Exception e) {
            e.printStackTrace();
        }

        StringTokenizer s = new StringTokenizer(ingredients, ",");
        ArrayList<String> ingrNames = new ArrayList<>();
        while (s.hasMoreTokens()) {
            ingrNames.add(s.nextToken().trim());
        }
        System.out.println(ingrNames);

        ArrayList<Integer> ingrsFound = new ArrayList<>();
        ArrayList<Ingredient> ingrs = getAllIngredients();
        for (Ingredient ingr : ingrs) {
            for (String ingrName : ingrNames) {
                if (ingr.getIngName().equals(ingrName)) {
                    ingrsFound.add(ingr.getIngId());
                    System.out.println("added");
                }
            }
        }

        try {
            String sql2 = "INSERT INTO [RecipeIngredients] (recipeId, IngId)"
                    + "VALUES (" + id + ",?)";
            PreparedStatement ps2 = connection.prepareStatement(sql2);

            for (int i : ingrsFound) {
                ps2.setInt(1, i);

                ps2.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            String sql3 = "INSERT INTO [savedRecipes] (userId, recipeId) VALUES (? , ?)";
            PreparedStatement ps3 = connection.prepareStatement(sql3);

            ps3.setInt(1, userId);
            ps3.setInt(2, id);
            ps3.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void duplicateRecipe(int userId, int recipeId){
        RecipeDAO rdao = new RecipeDAO();
        Recipe r = getRecipeByID(recipeId);
        r.setName("Copy of " + r.getName());
        addRecipe(userId, r.getName(), r.getInstructions(), r.getTags(), r.getServings(), r.getImage(), r.getIngredients());
        System.out.println("duplicated.");
    }
    
    public ArrayList<Ingredient> getAllIngredients() {
        String sql = "SELECT * from [Ingredients]";
        ArrayList<Ingredient> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Ingredient(rs.getInt(1), rs.getString(2)));
            }

        } catch (Exception e) {

        }
        return list;
    }

    public static void main(String[] args) {
        RecipeDAO rdao = new RecipeDAO();

        rdao.addRecipe(1, "a", "a", "a", "a", "a", "tomato");

    }

}
