const sqlite3 = require('sqlite3').verbose();

const dbPath = "/home/robinson/Desktop/ERP-RIR/";
const db = new sqlite3.Database(dbPath+'/storage/development.sqlite3');

db.serialize(() => {
    db.run("DELETE FROM usuarios WHERE nome = 'UsuarioSuper'", function (err) {
        if (err) {
            console.error('Erro ao apagar usuário:', err.message);
        } else {
            console.log(`Número de registros apagados: ${this.changes}`);
        }
    });
});

db.close();
