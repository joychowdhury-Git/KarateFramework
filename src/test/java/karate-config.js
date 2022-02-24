function fn(){
	var env = karate.env;
	if(!env)
	{
		env= 'dev';
	}
	
	var config= {
		env: env,
		baseUrl: 'https://gorest.co.in',
		tokenId: '575f2c93bffdee1d667a338b11fa27418dd47710c9d47203739f762d22f4c881'
	}
	if (env== 'dev'){
		
	}
	else if (env=='e2e')
	{
		
	}
	return config;
	}