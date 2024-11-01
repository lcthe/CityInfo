package org.dx.cityinfosys.service;

import org.dx.cityinfosys.mapper.CityInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CityInfoService {

    @Autowired
    private CityInfoMapper cityInfoMapper;

    public void register(String login_account, String password, int region_id, int is_admin){
        cityInfoMapper.register(login_account, password, region_id, is_admin);

    }



}
