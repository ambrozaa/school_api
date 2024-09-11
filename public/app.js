document.addEventListener('DOMContentLoaded', () => {
    const responseDiv = document.getElementById('response');
    const authToken = localStorage.getItem('authToken') || '';

    document.getElementById('create-student-form').addEventListener('submit', async (e) => {
        e.preventDefault();

        const formData = new FormData(e.target);
        const data = Object.fromEntries(formData.entries());

        try {
            const response = await fetch('/students', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ student: data })
            });

            // Отладка
            console.log(`Response status: ${response.status}`);
            const text = await response.text();
            console.log(`Response text: ${text}`);

            try {
                const result = JSON.parse(text);
                if (response.ok) {
                    localStorage.setItem('authToken', result.auth_token || '');
                    responseDiv.textContent = `Student Created: ${JSON.stringify(result)}`;
                } else {
                    responseDiv.textContent = `Error: ${result.error}`;
                }
            } catch (error) {
                responseDiv.textContent = `Error parsing JSON: ${error.message}`;
            }
        } catch (error) {
            responseDiv.textContent = `Network Error: ${error.message}`;
        }
    });

    // Убедитесь, что путь и метод запроса правильные
    document.getElementById('delete-student-form').addEventListener('submit', async (e) => {
        e.preventDefault();

        const studentId = document.getElementById('delete_student_id').value;

        try {
            const response = await fetch(`/students/${studentId}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${authToken}`
                }
            });

            // Отладка
            console.log(`Response status: ${response.status}`);
            const text = await response.text();
            console.log(`Response text: ${text}`);

            try {
                const result = JSON.parse(text);
                if (response.ok) {
                    responseDiv.textContent = `Student Deleted`;
                } else {
                    responseDiv.textContent = `Error: ${result.error}`;
                }
            } catch (error) {
                responseDiv.textContent = `Error parsing JSON: ${error.message}`;
            }
        } catch (error) {
            responseDiv.textContent = `Network Error: ${error.message}`;
        }
    });

    // Убедитесь, что путь и метод запроса правильные
    document.getElementById('get-student-form').addEventListener('submit', async (e) => {
        e.preventDefault();

        const studentId = document.getElementById('get_student_id').value;

        try {
            const response = await fetch(`/students/${studentId}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${authToken}`
                }
            });

            // Отладка
            console.log(`Response status: ${response.status}`);
            const text = await response.text();
            console.log(`Response text: ${text}`);

            try {
                const result = JSON.parse(text);
                if (response.ok) {
                    responseDiv.textContent = `Student Details: ${JSON.stringify(result)}`;
                } else {
                    responseDiv.textContent = `Error: ${result.error}`;
                }
            } catch (error) {
                responseDiv.textContent = `Error parsing JSON: ${error.message}`;
            }
        } catch (error) {
            responseDiv.textContent = `Network Error: ${error.message}`;
        }
    });
});