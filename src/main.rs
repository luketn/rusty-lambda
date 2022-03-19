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

    if let Some(first_name) = first_name {
        Ok(format!("Hello, {first_name}!").into_response())
    } else {
        Ok("Hello, rusty world! Add a query parameter 'firstName' for a personalised greeting.".into_response())
    }
}