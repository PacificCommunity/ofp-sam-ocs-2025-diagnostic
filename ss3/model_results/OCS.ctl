#C file created using an r4ss function
#C file write time: 2025-07-10  17:44:58
#
0 # 0 means do not read wtatage.ss; 1 means read and usewtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
2 # recr_dist_method for parameters
1 # not yet implemented; Future usage:Spawner-Recruitment; 1=global; 2=by area
1 # number of recruitment settlement assignments 
0 # unused option
# for each settlement assignment:
#_GPattern	month	area	age
1	1	1	0	#_recr_dist_pattern1
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
1 #_blocks_per_pattern
#_begin and end years of blocks
1994 1994
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=Maunder_M;_6=Age-range_Lorenzen
#_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr;5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0 #_placeholder for future growth feature
#
5 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
6 #_First_Mature_Age
2 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
3 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
 0.01	     0.4	       0.14	       -1.9	0.08	4	  4	0	0	0	0	  0	0	0	#_NatM_p_1_Fem_GP_1  
   30	     120	         64	         89	  10	6	 -4	0	0	0	0	0.5	0	0	#_L_at_Amin_Fem_GP_1 
   40	     350	        309	        266	  10	6	 -2	0	0	0	0	0.5	0	0	#_L_at_Amax_Fem_GP_1 
 0.05	    0.15	      0.085	      0.085	 0.8	6	 -4	0	0	0	0	0.5	0	0	#_VonBert_K_Fem_GP_1 
 0.01	       1	        0.1	  0.0834877	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_CV_young_Fem_GP_1  
   -3	       3	      0.085	          0	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_CV_old_Fem_GP_1    
   -3	       3	2.01667e-05	2.01667e-05	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_Wtlen_1_Fem_GP_1   
   -3	     3.5	      2.761	      2.761	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_Wtlen_2_Fem_GP_1   
   -3	     300	        194	         55	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_Mat50%_Fem_GP_1    
   -3	       3	     -0.138	     -0.138	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_Mat_slope_Fem_GP_1 
   -3	       9	          6	          1	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_Eggs_alpha_Fem_GP_1
   -3	       3	          0	          0	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_Eggs_beta_Fem_GP_1 
   -3	       3	          0	          0	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_NatM_p_1_Mal_GP_1  
   -3	       3	          0	          0	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_L_at_Amin_Mal_GP_1 
   -3	       3	          0	          0	 0.8	6	 -2	0	0	0	0	0.5	0	0	#_L_at_Amax_Mal_GP_1 
   -3	       3	          0	          0	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_VonBert_K_Mal_GP_1 
   -3	       3	          0	          0	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_CV_young_Mal_GP_1  
   -3	       3	          0	          0	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_CV_old_Mal_GP_1    
   -3	       3	1.18268e-05	1.18268e-05	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_Wtlen_1_Mal_GP_1   
   -3	       4	       2.86	       2.86	 0.8	6	 -3	0	0	0	0	0.5	0	0	#_Wtlen_2_Mal_GP_1   
   -4	       4	          0	          0	  99	0	 -3	0	0	0	0	0.5	0	0	#_RecrDist_GP_1      
   -4	       4	          0	          0	  99	0	 -3	0	0	0	0	0.5	0	0	#_RecrDist_Area_1    
   -4	       4	          4	          0	  99	0	 -3	0	0	0	0	0.5	0	0	#_RecrDist_month_1   
    1	       1	          1	          1	   1	0	 -1	0	0	0	0	  0	0	0	#_CohortGrowDev      
1e-06	0.999999	        0.5	        0.5	 0.5	0	-99	0	0	0	0	  0	0	0	#_FracFemale_GP_1    
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
7 #_Spawner-Recruitment; 2=Ricker (2 parms); 3=std_B-H(2); 4=SCAA(2);5=Hockey(3); 6=B-H_flattop(2); 7=Survival(3);8=Shepard(3);9=Ricker_Power(3);10=B-H_a,b(4)
0 # 0/1 to use steepness in initial equ recruitment calculation
0 # future feature: 0/1 to make realized sigmaR a function of SR curvature
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn # parm_name
    2	   10	  6	1.78 0.075	3	 1	0	0	0	0	0	0	0	#_SR_LN(R0)    
0.001	0.999	0.5	0.5	0.2	2	 7	0	0	0	0	0	0	0	#_SR_surv_Sfrac
  0.2	   10	1.5	  0	0.5	3	-8	0	0	0	0	0	0	0	#_SR_surv_Beta 
    0	    2	0.1	0.1	 99	0	-3	0	0	0	0	0	0	0	#_SR_sigmaR    
   -4	    4	  0	  0	 99	0	-1	0	0	0	0	0	1	1	#_SR_regime    
    0	    0	  0	  0	 99	0	-1	0	0	0	0	0	0	0	#_SR_autocorr  
# timevary SR parameters
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
-10	10	0.00447741	0	5	6	4	#_SR_regime_BLK1add_1994
2 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1995 # first year of main recr_devs; early devs can preceed this era
2029 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase
1 # (0/1) to read 13 advanced options
-5 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
2 #_recdev_early_phase
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1990 #_last_yr_nobias_adj_in_MPD; begin of ramp
1995 #_first_yr_fullbias_adj_in_MPD; begin of plateau
2014 #_last_yr_fullbias_adj_in_MPD
2023 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
0.3171 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-10 #min rec_dev
10 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
#Fishing Mortality info
0.5 # F ballpark
-1996 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
5 # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
0.001	 1	 0.134	-2	 1	3	 9	#_InitF_seas_1_flt_1F_NonTarLL
    0	10	 0.012	 0	99	0	-1	#_InitF_seas_1_flt_2F_AssoPS  
    0	10	0.0027	 0	99	0	-1	#_InitF_seas_1_flt_3F_UnAssoPS
#
#_Q_setup for fleets with cpue or survey data
#_fleet	link	link_info	extra_se	biasadj	float  #  fleetname
    4	1	0	0	0	1	#_S_NonTarLL
-9999	0	0	0	0	0	#_terminator
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
-15	15	-7.3223	0	0.1	0	1	0	0	0	0	0	0	0	#_LnQ_base_S_NonTarLL(4)
#_no timevary Q parameters
#
#_size_selex_patterns
#_Pattern	Discard	Male	Special
24	0	0	0	#_1 F_NonTarLL
 1	0	0	0	#_2 F_AssoPS  
 1	0	0	0	#_3 F_UnAssoPS
 5	0	0	1	#_4 S_NonTarLL
 5	0	0	2	#_5 S_AssoPS  
 5	0	0	3	#_6 S_UnAssoPS
#
#_age_selex_patterns
#_Pattern	Discard	Male	Special
11	0	0	0	#_1 F_NonTarLL
11	0	0	0	#_2 F_AssoPS  
11	0	0	0	#_3 F_UnAssoPS
11	0	0	0	#_4 S_NonTarLL
11	0	0	0	#_5 S_AssoPS  
11	0	0	0	#_6 S_UnAssoPS
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
 30	300	    200	170	 0	0	 1	0	0	0	0	0.5	0	0	#_SizeSel_P_1_F_NonTarLL(1)
-20	  4	     -2	-10	 0	0	 1	0	0	0	0	0.5	0	0	#_SizeSel_P_2_F_NonTarLL(1)
 -1	 10	    8.5	  8	 0	0	 1	0	0	0	0	0.5	0	0	#_SizeSel_P_3_F_NonTarLL(1)
 -1	 10	5.55747	  8	 0	0	 1	0	0	0	0	0.5	0	0	#_SizeSel_P_4_F_NonTarLL(1)
-10	 12	     -6	 -6	 0	0	 1	0	0	0	0	0.5	0	0	#_SizeSel_P_5_F_NonTarLL(1)
-10	 12	      6	 -6	 0	0	 1	0	0	0	0	0.5	0	0	#_SizeSel_P_6_F_NonTarLL(1)
  1	300	    150	150	99	6	 2	0	0	0	0	0.5	0	0	#_SizeSel_P_1_F_AssoPS(2)  
  1	300	    100	100	99	6	 2	0	0	0	0	0.5	0	0	#_SizeSel_P_2_F_AssoPS(2)  
  1	300	    150	150	99	6	 2	0	0	0	0	0.5	0	0	#_SizeSel_P_1_F_UnAssoPS(3)
  1	300	    100	100	99	6	 2	0	0	0	0	0.5	0	0	#_SizeSel_P_2_F_UnAssoPS(3)
  1	200	     -1	 50	99	6	-2	0	0	0	0	0.5	0	0	#_SizeSel_P_1_S_NonTarLL(4)
  1	239	     -1	 50	99	6	-3	0	0	0	0	0.5	0	0	#_SizeSel_P_2_S_NonTarLL(4)
  1	200	     -1	 50	99	6	-2	0	0	0	0	0.5	0	0	#_SizeSel_P_1_S_AssoPS(5)  
  1	239	     -1	 50	99	6	-3	0	0	0	0	0.5	0	0	#_SizeSel_P_2_S_AssoPS(5)  
  1	200	     -1	 50	99	6	-2	0	0	0	0	0.5	0	0	#_SizeSel_P_1_S_UnAssoPS(6)
  1	239	     -1	 50	99	6	-3	0	0	0	0	0.5	0	0	#_SizeSel_P_2_S_UnAssoPS(6)
#_AgeSelex
1	40	 0	1	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_1_F_NonTarLL(1)
1	40	25	3	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_2_F_NonTarLL(1)
1	40	 0	1	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_1_F_AssoPS(2)  
1	40	25	3	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_2_F_AssoPS(2)  
1	40	 0	1	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_1_F_UnAssoPS(3)
1	40	25	3	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_2_F_UnAssoPS(3)
1	40	 0	1	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_1_S_NonTarLL(4)
1	40	25	3	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_2_S_NonTarLL(4)
1	40	 0	1	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_1_S_AssoPS(5)  
1	40	25	3	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_2_S_AssoPS(5)  
1	40	 0	1	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_1_S_UnAssoPS(6)
1	40	25	3	99	6	-1	0	0	0	0	0.5	0	0	#_AgeSel_P_2_S_UnAssoPS(6)
#_no timevary selex parameters
#
0 #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
# Tag loss and Tag reporting parameters go next
0 # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# Input variance adjustments factors: 
#_factor	fleet	value
    4	1	1.50073	#_Variance_adjustment_list1
    4	2	1.18208	#_Variance_adjustment_list2
    4	3	1.16701	#_Variance_adjustment_list3
    4	4	1.67657	#_Variance_adjustment_list4
    4	5	   0.01	#_Variance_adjustment_list5
    4	6	   0.01	#_Variance_adjustment_list6
-9999	0	      0	#_terminator               
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 18 changes to default Lambdas (default value is 1.0)
#_like_comp	fleet	phase	value	sizefreq_method
    1	1	1	0	1	#_Surv_F_NonTarLL_Phz1                    
    1	2	1	0	1	#_Surv_F_AssoPS_Phz1                      
    1	3	1	0	1	#_Surv_F_UnAssoPS_Phz1                    
    1	4	1	1	1	#_Surv_S_NonTarLL_Phz1                    
    1	5	1	0	1	#_Surv_S_AssoPS_Phz1                      
    1	6	1	0	1	#_Surv_S_UnAssoPS_Phz1                    
    4	1	1	1	1	#_length_F_NonTarLL_sizefreq_method_1_Phz1
    4	2	1	1	1	#_length_F_AssoPS_sizefreq_method_1_Phz1  
    4	3	1	1	1	#_length_F_UnAssoPS_sizefreq_method_1_Phz1
    4	4	1	1	1	#_length_S_NonTarLL_sizefreq_method_1_Phz1
    4	5	1	1	1	#_length_S_AssoPS_sizefreq_method_1_Phz1  
    4	6	1	1	1	#_length_S_UnAssoPS_sizefreq_method_1_Phz1
    9	1	1	0	1	#_init_equ_catch_F_NonTarLL_Phz1          
    9	2	1	0	1	#_init_equ_catch_F_AssoPS_Phz1            
    9	3	1	0	1	#_init_equ_catch_F_UnAssoPS_Phz1          
    9	4	1	0	1	#_init_equ_catch_S_NonTarLL_Phz1          
    9	5	1	0	1	#_init_equ_catch_S_AssoPS_Phz1            
    9	6	1	0	1	#_init_equ_catch_S_UnAssoPS_Phz1          
-9999	0	0	0	0	#_terminator                              
#
0 # 0/1 read specs for more stddev reporting
#
999
