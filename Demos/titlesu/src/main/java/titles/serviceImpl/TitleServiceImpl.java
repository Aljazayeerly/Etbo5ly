/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package titles.serviceImpl;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import titles.exceptions.IllegalOrphanException;
import titles.exceptions.NonexistentEntityException;
import titles.model.daos.TitleJpaController;
import titles.model.pojos.Title;
import titles.service.TitleService;


@Service
public class TitleServiceImpl implements TitleService {

    @Autowired
    TitleJpaController titleJpaController;

    public List<Title> retrieveAllTitles() {
       return titleJpaController.findTitleEntities();
    }

    @Transactional
    public Title retrieveTitle(Title title) {
        return titleJpaController.findTitle(title.getId());
    }

    @Transactional
    public void delete(Title title) {
        try {
            titleJpaController.destroy(title.getId());
        } catch (IllegalOrphanException ex) {
            Logger.getLogger(TitleServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(TitleServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Transactional
    public void update(Title title) {
        
            titleJpaController.edit(title);
       
    }

    @Transactional
    public void addTitle(Title title) {
        titleJpaController.create(title);
    }

    
}
