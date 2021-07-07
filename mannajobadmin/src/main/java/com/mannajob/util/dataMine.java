package com.mannajob.util;

import org.snu.ids.ha.index.Keyword;
import org.snu.ids.ha.index.KeywordExtractor;
import org.snu.ids.ha.index.KeywordList;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
@Component("dataMine")
public class dataMine {
	public void mining(String data)
    {
          try {
                
                KeywordExtractor ke = new KeywordExtractor();
                // extract keywords
                KeywordList kl = ke.extractKeyword(data, true);
                // print result
                for( int i = 0; i < kl.size(); i++ ) {
              	  Keyword kwrd = kl.get(i);
              	  log.info(kwrd.getString() + "\t" + kwrd.getCnt());
                }
                
          } catch (Exception e) {
                e.printStackTrace();
          }
          
    }
}