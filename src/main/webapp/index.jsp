<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculat</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
        }
        .calculator {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 300px;
        }
        .result {
            width: 100%;
            height: 50px;
            margin-bottom: 10px;
            font-size: 1.5rem;
            text-align: right;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
        }
        .numbers {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            width: 70%;
        }
        .operands {
            display: flex;
            flex-direction: column;
            gap: 10px;
            width: 25%;
        }
        button {
            height: 50px;
            font-size: 1.2rem;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background-color: #3b4307;
        }
        .operator {
            background-color: #28a745;
        }
        .operator:hover {
            background-color: #1e7e34;
        }
        .clear {
            background-color: #dc3545;
        }
        .clear:hover {
            background-color: #bd2130;
        }
        
    </style>
</head>
<body>
    <div class="calculator">
        <input type="text" id="result" class="result" disabled>
        <div class="buttons">
            <div class="numbers">
                <button onclick="appendValue('7')">7</button>
                <button onclick="appendValue('8')">8</button>
                <button onclick="appendValue('9')">9</button>
                <button onclick="appendValue('4')">4</button>
                <button onclick="appendValue('5')">5</button>
                <button onclick="appendValue('6')">6</button>
                <button onclick="appendValue('1')">1</button>
                <button onclick="appendValue('2')">2</button>
                <button onclick="appendValue('3')">3</button>
                <button onclick="appendValue('0')" style="grid-column: span 2;">0</button>
                <button onclick="appendValue('.')">.</button>
            </div>
            <div class="operands">
                <button onclick="clearResult()" class="clear">C</button>
                <button onclick="appendValue('/')" class="operator">/</button>
                <button onclick="appendValue('*')" class="operator">*</button>
                <button onclick="appendValue('-')" class="operator">-</button>
                <button onclick="appendValue('+')" class="operator">+</button>
                <button onclick="calculateResult()" class="operator">=</button>
                <button onclick="deleteLast()">DEL</button>
            </div>
        </div>
    </div>

    <script>
        const resultField = document.getElementById('result');

        function appendValue(value) {
            resultField.value += value;
        }

        function clearResult() {
            resultField.value = '';
        }

        function deleteLast() {
            resultField.value = resultField.value.slice(0, -1);
        }

        function calculateResult() {
            try {
                resultField.value = eval(resultField.value);
            } catch {
                resultField.value = 'Error';
            }
        }
    </script>
    
</body>
</html>
