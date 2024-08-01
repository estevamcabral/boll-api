package com.boll.services;

import com.boll.entities.Player;
import com.boll.repositories.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlayerService {

    @Autowired
    private PlayerRepository playerRepository;

    public void createPlayer(Player player){
       playerRepository.save(player);
    }

}
