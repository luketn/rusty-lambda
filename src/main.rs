use lambda_http::{service_fn, Error, RequestExt, Request, IntoResponse};

#[tokio::main]
async fn main() -> Result<(), Error> {
    let func = service_fn(func);
    lambda_http::run(func).await?;
    Ok(())
}

async fn func(event: Request) -> Result<impl IntoResponse, Error> {
    let query_string_parameters = event.query_string_parameters();
    let first_name = query_string_parameters.first("firstName");
    let greeting = greeting_for_name(first_name);

    Ok(greeting.into_response())
}

fn greeting_for_name(first_name: Option<&str>) -> String {
    if let Some(first_name) = first_name {
        format!("Hello, {first_name}!")
    } else {
        String::from("Hello, rusty world! Add a query parameter 'firstName' for a personalised greeting.")
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn greeting_for_name_test_with_param() {
        let result = greeting_for_name(Some("Luke"));
        assert_eq!(result, "Hello, Luke!")
    }

    #[tokio::test]
    async fn greeting_for_name_test_without_param() {
        let result = greeting_for_name(None);
        assert_eq!(result, "Hello, rusty world! Add a query parameter 'firstName' for a personalised greeting.")
    }

}
