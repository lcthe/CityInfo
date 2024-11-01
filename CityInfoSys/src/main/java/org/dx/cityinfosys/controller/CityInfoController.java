package org.dx.cityinfosys.controller;


import jakarta.validation.constraints.NotNull;
import org.dx.cityinfosys.entity.ApiResponse;
import org.dx.cityinfosys.service.CityInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Validated
@RequestMapping("/CityInfo")
public class CityInfoController {

    @Autowired
    private CityInfoService cityInfoService;

    @PostMapping("/register")
    public ApiResponse<Void> register(
            @RequestParam("login_account") @NotNull String login_account,
            @RequestParam("password") @NotNull String password,
            @RequestParam("region_id") @NotNull int region_id,
            @RequestParam("is_admin") @NotNull int is_admin) {

        cityInfoService.register(login_account, password, region_id, is_admin);
        return ApiResponse.success("0", "register successful", null);
    }

    @PostMapping("/logger")
    public ApiResponse<Void> login(
            @RequestParam("login_account") @NotNull String login_account,
            @RequestParam("password") @NotNull String password){

        System.out.println("login");
        return ApiResponse.success("0", "login successful", null);
    }

}
