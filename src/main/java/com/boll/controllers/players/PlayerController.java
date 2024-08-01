package com.boll.controllers.players;

import com.boll.entities.Player;
import com.boll.services.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/players")
public class PlayerController {
    @Autowired
    PlayerService playerService;

    @PostMapping
    private void create(){
        Player player = new Player();
        player.setName("User teste");
        player.setEmail("emailteste@email.com");
        player.setTelephone("51984171945");

        playerService.createPlayer(player);
    }

}
