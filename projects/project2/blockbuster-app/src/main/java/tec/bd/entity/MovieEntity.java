package tec.bd.entity;

import java.util.Date;

public class MovieEntity {
    private int id;
    private String title;
    private Date releaseDate;
    private int categoryID;
    private int unitsAvailable;
    private CategoryEntity category;

    public MovieEntity(int id, String title, Date releaseDate, int categoryID, int unitsAvailable) {
        this.id = id;
        this.title = title;
        this.releaseDate = releaseDate;
        this.categoryID = categoryID;
        this.unitsAvailable = unitsAvailable;
    }

    public MovieEntity(String title, Date releaseDate, int categoryID, int unitsAvailable) {
        this.title = title;
        this.releaseDate = releaseDate;
        this.categoryID = categoryID;
        this.unitsAvailable = unitsAvailable;
    }

    public MovieEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getUnitsAvailable() {
        return unitsAvailable;
    }

    public void setUnitsAvailable(int unitsAvailable) {
        this.unitsAvailable = unitsAvailable;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }
}
