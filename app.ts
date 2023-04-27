function handleSubmit(event: Event): void {
    event.preventDefault();
    const formData:FormData = new FormData(event.target as HTMLFormElement);
    const jsonData = Object.fromEntries(formData.entries());
    const jsonText:string = JSON.stringify(jsonData, null, 2);
    console.log(jsonText);
}
