Creating-teams-with-the-maximum-number-of-paired-males-and-females                                                                       
                                                                                                                                         
We have a list of available male and female players from two states, OHIO and IOWA.                                                      
                                                                                                                                         
We need to form two teams with the maximum number of male and female pairs.                                                              
                                                                                                                                         
     Two Solutions                                                                                                                       
         a. SAS DOW loop                                                                                                                 
         b. R                                                                                                                            
github                                                                                                                                   
https://tinyurl.com/y9e5lfma                                                                                                             
https://github.com/rogerjdeangelis/utl-creating-teams-with-the-maximum-number-of-paired-males-and-females-dow-R                          
                                                                                                                                         
Stackoverflow                                                                                                                            
https://tinyurl.com/ycduv4sa                                                                                                             
https://stackoverflow.com/questions/62468061/reduce-dataframe-to-get-equal-amounts-of-rows-per-value-by-group                            
                                                                                                                                         
Ronak Shah                                                                                                                               
https://stackoverflow.com/users/3962914/ronak-shah                                                                                       
                                                                                                                                         
*_                   _                                                                                                                   
(_)_ __  _ __  _   _| |_                                                                                                                 
| | '_ \| '_ \| | | | __|                                                                                                                
| | | | | |_) | |_| | |_                                                                                                                 
|_|_| |_| .__/ \__,_|\__|                                                                                                                
        |_|                                                                                                                              
;                                                                                                                                        
options validvarname=upcase;                                                                                                             
libname sd1 "d:/sd1";                                                                                                                    
data sd1.have;                                                                                                                           
input                                                                                                                                    
 team$ sex$ handicap;                                                                                                                    
cards4;                                                                                                                                  
OHIO F 10                                                                                                                                
OHIO M 15                                                                                                                                
OHIO M 16                                                                                                                                
OHIO M 13                                                                                                                                
IOWA F 14                                                                                                                                
IOWA F 13                                                                                                                                
IOWA M 10                                                                                                                                
IOWA M 17                                                                                                                                
IOWA M 11                                                                                                                                
IOWA M 16                                                                                                                                
;;;;                                                                                                                                     
run;quit;                                                                                                                                
                                                                                                                                         
                                                                                                                                         
Up to 40 obs from SD1.HAVE total obs=10                                                                                                  
                                                                                                                                         
                               | RULES                                                                                                   
                               |                                                                                                         
Obs    TEAM     SEX    HANDICAP| TEAM    SEX   HANDICAP                                                                                  
                               |                                                                                                         
  1    OHIO     F        10    | OHIO     F    10  Only one pair is possible                                                             
  2    OHIO     M        15    | OHIO     M    15                                                                                        
  3    OHIO     M        16    |                                                                                                         
  4    OHIO     M        13    |                                                                                                         
                                                                                                                                         
  5    IOWA     F        14    | IOWA     F    14  Two pairss are possible                                                               
  6    IOWA     F        13    | IOWA     F    13                                                                                        
  7    IOWA     M        10    | IOWA     M    10                                                                                        
  8    IOWA     M        17    | IOWA     M    17                                                                                        
  9    IOWA     M        11    |                                                                                                         
 10    IOWA     M        16    |                                                                                                         
                                                                                                                                         
*            _               _                                                                                                           
  ___  _   _| |_ _ __  _   _| |_                                                                                                         
 / _ \| | | | __| '_ \| | | | __|                                                                                                        
| (_) | |_| | |_| |_) | |_| | |_                                                                                                         
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                        
                |_|                                                                                                                      
;                                                                                                                                        
                                                                                                                                         
 WORK.WANT total obs=6                                                                                                                   
                                                                                                                                         
  TEAM    SEX    HANDICAP                                                                                                                
                                                                                                                                         
  OHIO     F        10                                                                                                                   
  OHIO     M        15                                                                                                                   
                                                                                                                                         
  IOWA     F        14                                                                                                                   
  IOWA     F        13                                                                                                                   
  IOWA     M        10                                                                                                                   
  IOWA     M        17                                                                                                                   
                                                                                                                                         
*          _       _   _                                                                                                                 
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                                 
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                                                
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                                
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                                
               _                                                                                                                         
  __ _      __| | _____      __                                                                                                          
 / _` |    / _` |/ _ \ \ /\ / /                                                                                                          
| (_| |_  | (_| | (_) \ V  V /                                                                                                           
 \__,_(_)  \__,_|\___/ \_/\_/                                                                                                            
                                                                                                                                         
;                                                                                                                                        
                                                                                                                                         
data want;                                                                                                                               
                                                                                                                                         
 Do until (last.team);                                                                                                                   
                                                                                                                                         
  set sd1.have ;                                                                                                                         
  by team notsorted;                                                                                                                     
                                                                                                                                         
  cnt_m=sum(cnt_m,(sex="M"));                                                                                                            
  cnt_f=sum(cnt_f,(sex="F"));                                                                                                            
                                                                                                                                         
 end;                                                                                                                                    
                                                                                                                                         
 min_sex=min(cnt_m,cnt_f); * max number of couples;                                                                                      
                                                                                                                                         
 keep_m=1;  * flag to keep or delete;                                                                                                    
 keep_f=1;                                                                                                                               
                                                                                                                                         
 cnt_m =0;                                                                                                                               
 cnt_f =0;                                                                                                                               
                                                                                                                                         
 Do until (last.team);                                                                                                                   
                                                                                                                                         
  set sd1.have;                                                                                                                          
  by team notsorted;                                                                                                                     
                                                                                                                                         
  cnt_m=sum(cnt_m,(sex="M"));                                                                                                            
  cnt_f=sum(cnt_f,(sex="F"));                                                                                                            
                                                                                                                                         
  if cnt_f gt min_sex then keep_f=0; * exceed count then delete;                                                                         
  if cnt_m gt min_sex then keep_m=0;                                                                                                     
                                                                                                                                         
  keep team sex handicap;                                                                                                                
  if keep_m*keep_f=1 then output;                                                                                                        
                                                                                                                                         
 end;                                                                                                                                    
                                                                                                                                         
run;quit;                                                                                                                                
                                                                                                                                         
*_        ____                                                                                                                           
| |__    |  _ \                                                                                                                          
| '_ \   | |_) |                                                                                                                         
| |_) |  |  _ <                                                                                                                          
|_.__(_) |_| \_\                                                                                                                         
                                                                                                                                         
                                                                                                                                         
%utl_submit_r64('                                                                                                                        
library(dplyr);                                                                                                                          
library(haven);                                                                                                                          
library(SASxport);                                                                                                                       
library(data.table);                                                                                                                     
have<-read_sas("d:/sd1/have.sas7bdat");                                                                                                  
want<-have %>%                                                                                                                           
  add_count(TEAM, SEX) %>%                                                                                                               
  group_by(TEAM) %>%                                                                                                                     
  mutate(n = min(n)) %>%                                                                                                                 
  group_by(SEX, .add = TRUE) %>%                                                                                                         
  sample_n(n) %>%                                                                                                                        
  select(-n);                                                                                                                            
want<-as.data.table(want);                                                                                                               
write.xport(want,file="d:/xpt/want.xpt");                                                                                                
');                                                                                                                                      
                                                                                                                                         
libname xpt xport "d:/xpt/want.xpt";                                                                                                     
data want;                                                                                                                               
  set xpt.want;                                                                                                                          
run;quit;                                                                                                                                
libname xpt clear;                                                                                                                       
                                                                                                                                         
