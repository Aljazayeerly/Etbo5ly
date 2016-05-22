/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package titles.model.pojos;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;


@Embeddable
public class UserRatingPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "user_id")
    private int userId;
    @Basic(optional = false)
    @Column(name = "title_id")
    private int titleId;

    public UserRatingPK() {
    }

    public UserRatingPK(int userId, int titleId) {
        this.userId = userId;
        this.titleId = titleId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTitleId() {
        return titleId;
    }

    public void setTitleId(int titleId) {
        this.titleId = titleId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) userId;
        hash += (int) titleId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserRatingPK)) {
            return false;
        }
        UserRatingPK other = (UserRatingPK) object;
        if (this.userId != other.userId) {
            return false;
        }
        if (this.titleId != other.titleId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication10.UserRatingPK[ userId=" + userId + ", titleId=" + titleId + " ]";
    }
    
}
