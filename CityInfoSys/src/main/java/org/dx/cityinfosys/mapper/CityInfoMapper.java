package org.dx.cityinfosys.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CityInfoMapper {

    @Insert("INSERT INTO collector(login_account, password, region_id, is_admin) "+
            "VALUES (#{login_account}, #{password}, #{region_id}, #{is_admin})")
    void register(String login_account, String password, int region_id, int is_admin);

}
