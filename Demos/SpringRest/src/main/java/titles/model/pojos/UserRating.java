/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package titles.model.pojos;


import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;


@Entity
@Table(name = "user_rating")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserRating.findAll", query = "SELECT u FROM UserRating u"),
    @NamedQuery(name = "UserRating.findByUserId", query = "SELECT u FROM UserRating u WHERE u.userRatingPK.userId = :userId"),
    @NamedQuery(name = "UserRating.findByTitleId", query = "SELECT u FROM UserRating u WHERE u.userRatingPK.titleId = :titleId"),
    @NamedQuery(name = "UserRating.findByRating", query = "SELECT u FROM UserRating u WHERE u.rating = :rating"),
    @NamedQuery(name = "UserRating.findByComment", query = "SELECT u FROM UserRating u WHERE u.comment = :comment")})

public class UserRating implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserRatingPK userRatingPK;
    @Column(name = "rating")
    private Short rating;
    @Column(name = "comment")
    private String comment;
    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "title_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Title title;

    public UserRating() {
    }

    public UserRating(UserRatingPK userRatingPK) {
        this.userRatingPK = userRatingPK;
    }

    public UserRating(int userId, int titleId) {
        this.userRatingPK = new UserRatingPK(userId, titleId);
    }

    public UserRatingPK getUserRatingPK() {
        return userRatingPK;
    }

    public void setUserRatingPK(UserRatingPK userRatingPK) {
        this.userRatingPK = userRatingPK;
    }

    public Short getRating() {
        return rating;
    }

    public void setRating(Short rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @JsonIgnore
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @JsonIgnore
    public Title getTitle() {
        return title;
    }

    public void setTitle(Title title) {
        this.title = title;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userRatingPK != null ? userRatingPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserRating)) {
            return false;
        }
        UserRating other = (UserRating) object;
        if ((this.userRatingPK == null && other.userRatingPK != null) || (this.userRatingPK != null && !this.userRatingPK.equals(other.userRatingPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication10.UserRating[ userRatingPK=" + userRatingPK + " ]";
    }
    
}
