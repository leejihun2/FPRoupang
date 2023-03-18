package com.edu.springboot.wordcount;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/data")
public class DataControllerOK {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/search_log")
    public void getSearchLog() {
        String query = "SELECT SEARCH_WORD, MEMBER_IDX, USER_BIRTH, to_char(SEARCH_REGIDATE,'HH24') AS SearchRegidate FROM search_log";
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(query);
        // 나이승 나이승 나이승
        try (PrintWriter writer = new PrintWriter(new FileWriter("C:\\Users\\82104\\search_log11.txt"))) {
            rows.stream().map(row -> {
                // 컬럼 이름을 바꿔줍니다.
                Map<String, Object> newRow = new HashMap<>();
                newRow.put("SearchWord", row.get("SEARCH_WORD"));
                newRow.put("MemberIndex", row.get("MEMBER_IDX"));
				newRow.put("UserBirth", row.get("USER_BIRTH"));
				newRow.put("SearchRegidate", row.get("SearchRegidate")+"시");
                
                return newRow;
            }).forEach(row -> {
                for (Map.Entry<String, Object> entry : row.entrySet()) {
                    writer.println(entry.getKey() + ": " + (entry.getValue() != null ? entry.getValue().toString() : "null"));
                }
                writer.println();
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
