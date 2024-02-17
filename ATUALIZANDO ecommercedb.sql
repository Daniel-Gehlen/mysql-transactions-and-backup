-- Backup do banco de dados ecommercedb usando o caminho especificado na tabela backup_config
SET @backup_path_query := 'SELECT backup_path FROM ecommercedb.backup_config WHERE id = 1 INTO @backup_path';
PREPARE stmt FROM @backup_path_query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @backup_command := CONCAT('mysqldump ecommercedb > ', @backup_path);
-- Executando o comando de backup
SELECT @backup_command;
