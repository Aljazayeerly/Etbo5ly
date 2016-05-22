/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package titles.service;

import java.util.List;
import titles.model.pojos.Title;


public interface TitleService {
    List<Title> retrieveAllTitles();
    Title retrieveTitle(Title title);
    void delete(Title title);
    void update(Title title);
    void addTitle(Title title);
}