package com.ezappx.builder

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import springfox.documentation.builders.ApiInfoBuilder
import springfox.documentation.builders.PathSelectors
import springfox.documentation.builders.RequestHandlerSelectors
import springfox.documentation.spi.DocumentationType
import springfox.documentation.spring.web.plugins.Docket
import springfox.documentation.swagger2.annotations.EnableSwagger2

/**
 * Swagger2配置
 */
@Configuration
@EnableSwagger2
class Swagger2Config {

    @Bean
    fun createRestApi(): Docket = Docket(DocumentationType.SWAGGER_2)
            .apiInfo(apiInfo())
            .select()
            .apis(RequestHandlerSelectors.any())
            .paths(PathSelectors.any())
            .build()

    private fun apiInfo() = ApiInfoBuilder()
            .title("Ezappx Builder")
            .description("Ezappx移动应用打包API")
            .termsOfServiceUrl("http://www.ezappx.com")
            .version("1.0.0")
            .build()
}